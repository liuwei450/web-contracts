// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract MtkContracts {
    //枚举-质押周期类型（可自定义）
    enum StakingPeriod { ThirtyDays, NinetyDays, HundredEightyDays, OneYear }
   //0xfea7f4509F643038B5A9C1220BF0f5c661FA7ffc IERC20
   //0x81C0C4d1a073A77Eb3f6C4a81c4aC04dbf35E8dC 质押合约
    
    // 定义质押订单结构体
    struct Stake{
        uint256 stakeId;         //唯一索引
        uint256 amount;             // 质押数量
        uint256 startTime;          // 质押开始时间
        uint256 endTime;            // 质押结束时间
        uint256 rewardRate;         // 收益率（根据期限计算）
        bool isActive;              // 订单是否有效
        StakingPeriod period;        // 质押期限
    }
    

    IERC20 public  stakingToken;//质押代币合约
 
    mapping(address => Stake[]) public userStakes; // 用户的所有质押订单
    mapping(uint256 => address) public stakeIdToOwner; // 质押ID到所有者的映射
    mapping(StakingPeriod => uint256) public apy; // 年化收益率（百分比，如20表示20%）
    mapping(StakingPeriod=>uint256) public durations; // 不同期限对应的秒数 
    uint256 private nonce; //增加ID
    error StakeNotFound();//自定义错误 
    //质押事件 记录链上日志
     event Staked(
        address indexed user,   //发起质押的用户地址
        uint256 stakeId,        //唯一索引
        uint256 amount,         // 质押数量
        StakingPeriod period,    // 质押期限
        uint256 timestamp
    );
    //提现事件 记录链上日志
    event Withdrawn(
        address indexed user, //提现的用户地址
        uint256 stakeId,  //对应的质押ID
        uint256 principal, //提现的本金
        uint256 totalAmount,//本金 + 利息
        uint256 stakeIndex //用户所有质押列表中的位置索引 
    );
    //构造函数初始化合约
    constructor(IERC20 _mtkToken) {
        stakingToken = _mtkToken;
        // 初始化不同期限的持续时间（测试环境用分钟，生产环境应用days）
        durations[StakingPeriod.ThirtyDays] = 30 days;
        durations[StakingPeriod.NinetyDays] = 90 days;
        durations[StakingPeriod.HundredEightyDays] = 180 days;
        durations[StakingPeriod.OneYear] = 360 days;
        // 初始化不同期限的年化收益率
        apy[StakingPeriod.ThirtyDays] = 10;   // 10% 年化
        apy[StakingPeriod.NinetyDays] = 15;   // 15% 年化
        apy[StakingPeriod.HundredEightyDays] = 18; // 18% 年化
        apy[StakingPeriod.OneYear] = 20;      // 20% 年化
    }
    /// 质押函数
    function stake(uint256 amount, StakingPeriod period) external {
       
        require(amount>0,"amount must be greater than zero");
        //用户必须提前通过 approve() 授权合约代为转账 将用户的代币转入本合约账户
        require(stakingToken.transferFrom(msg.sender, address(this), amount), "Transfer failed");

        uint256 duration=_getDuration(period);//获取分钟
        uint256 periodDays=durations[period]; //质押期间
        uint256 rate=apy[period]*periodDays*10**18/360 days; //计算实际收益
        uint256 stakeId = _generateStakeId();       //质押ID
       
        Stake memory newStake = Stake({
            stakeId: stakeId,
            amount: amount,
            startTime: block.timestamp,
            endTime: block.timestamp+duration,
            rewardRate: rate, // 收益率（根据期限计算）
            isActive: true,    // 订单是否有效
            period: period
        });

        userStakes[msg.sender].push(newStake);
        stakeIdToOwner[stakeId] = msg.sender;
        //触发事件
        emit Staked(msg.sender,stakeId, amount, period, block.timestamp);
    }
    // 生成唯一的质押ID
    function _generateStakeId() internal returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, nonce++)));
    }

    // 内部函数：根据期限返回秒数
    function _getDuration(StakingPeriod period) internal pure returns (uint256) {
        if(period==StakingPeriod.ThirtyDays){
            return  1 minutes;
        }else if(period==StakingPeriod.NinetyDays){
            return  3 minutes;
        }else if(period==StakingPeriod.HundredEightyDays){
            return  5 minutes;
        }else {
            return  10 minutes;
        }
    }
        
    //提现-提现金额是要大于本金的，利息和奖励是项目方发的
    function withdraw(uint256 stakeId) external {
       // 检查调用者是否是质押记录的所有者
        require(stakeIdToOwner[stakeId] == msg.sender, "Not the owner of this stake");
        Stake storage stk;
        uint256 stakeIndex;
        (stk, stakeIndex) = _getStakeById(msg.sender, stakeId); 
       
        require(stk.isActive, "stk is not active");
        console.log("value:", stk.endTime); 
        //质押时间没有到
        require(block.timestamp >= stk.endTime, "Staking period is not over");
        //质押状态为非活跃
        stk.isActive=false;
        
        uint256 reward = stk.amount * stk.rewardRate  / 100/10**18;
        uint256 totalAmount = stk.amount + reward;
        // 将质押的代币和收益转移给用户
        require(stakingToken.transfer(msg.sender, totalAmount),"Transfer failed");
        emit Withdrawn(msg.sender,stakeId,stk.amount,reward, totalAmount);
    }
    //  根据ID获取质押信息
    function _getStakeById(address user,uint256 stakeId)internal view returns ( Stake storage, uint256){
       
        for (uint256 i=0;i<userStakes[user].length;i++){
            if (userStakes[user][i].stakeId==stakeId) {
                return (userStakes[user][i],i);
            }
        }
       revert StakeNotFound();

    }
    
   


}