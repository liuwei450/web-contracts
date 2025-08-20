// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./IERC20.sol"; 

contract Airdrop{
    address public gov;  // 治理者地址（拥有 onlyGov 权限）
    IERC20 public token; // ERC20 代币接口实例（关联目标代币合约）
    //事件声明
     event AirdropERC20(address indexed recipient, uint256 amount);
     event AirdropBNB(address indexed recipient, uint256 amount);
     // 权限控制修饰器：仅治理者可调用
     modifier onlyGov() {
        require(msg.sender == gov, "Airdrop: caller is not governor");
        _; 
    }
    // 构造函数：初始化治理者和 ERC20 代币地址
    constructor(address _tokenAddress) {
        gov = msg.sender; // 部署者默认为治理者
        token = IERC20(_tokenAddress); // 关联目标 ERC20 代币合约（如你的 MyToken）
    }
    function setGov(address _newGov)public  onlyGov{
         require(_newGov != address(0), "Airdrop: new gov is zero address");
        gov = _newGov;
        
    }

    //ERC20 空投逻辑
    function airdropERC20(address[] memory recipients, uint256[] memory amounts) external onlyGov {
    // 第一步：验证两个数组长度是不是相等
    require(recipients.length==amounts.length, unicode"两个长度不相等");
    uint256 totalAmount;
    // 判断转账的amount是否等于amounts之和
    for (uint256 i=0;i<recipients.length;i++){
        address recipient=recipients[i];
        uint256 amount=amounts[i];
        require(recipient!=address(0),unicode"接收地址不存在");
        require(amount>0,unicode"amount为0");
        totalAmount +=amount;
    }
    //验证治理者授权额度是否足够
    require(token.allowance(gov,address(this))>=totalAmount,unicode"授权余额不足");
    // 遍历去转账空投
    for(uint256 i=0;i<recipients.length;i++){
        address recipient=recipients[i];
        uint256 amount=amounts[i];
        bool success=token.transferFrom(gov, recipient, amount);
        // 每一个地址空投需要将address, amount 事件抛出
        require(success,unicode"转账空投失败");
        emit AirdropERC20(recipient, amount);
    }
    
    }
    //BNB 空投逻辑
    function airdropBNB(address[] memory recipients, uint256[] memory amounts) external payable onlyGov {
        // 第一步：验证两个数组长度是不是相等，验证接收的BNB数量是不是等于amounts数组之和
        require(recipients.length==amounts.length,unicode"BNB两个数组长度不相等");
        uint256 toalAmount;
        for(uint256 i=0;i<recipients.length;i++){
            address recipient=recipients[i];
            uint256 amount=amounts[i];
            require(recipient!=address(0),unicode"BNB转账地址不为空");
            require(amount>0,unicode"BNB转账不为0");
            toalAmount+=amount;

        }
        require(msg.value==toalAmount,unicode"BNB msg.value 不等于总金额");
        // 遍历去转账空投
        for (uint256 i=0;i<recipients.length;i++){
            address recipient=recipients[i];
            uint256 amount=amounts[i];
            // 每一个地址空投需要将address, amount 事件抛出
            (bool success,)=recipient.call{value:amount}("");
            require(success,unicode"BNB转账失败");
            emit AirdropBNB(recipient,amount);
        } 
    }
    // 接收 BNB 的回退函数（必须，否则 BNB 转账会失败）
    receive() external payable { }
}