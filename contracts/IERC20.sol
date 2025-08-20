// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IERC20 {
    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint256 public totalSupply; //表示当前总发行代币数量
    //每个用户的钱包余额
    mapping(address => uint256) public balanceOf; 
    //允许某地址（授权人）授权另一地址（代理人）一定额度的代币可以花
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    //代币初始化
    constructor(uint256 initialSupply) {
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }
    //转账功能
    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool success) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
    /*
     * from: 被授权的代币持有者地址（发起转账的人）
     * to: 接收代币的地址。
     * value: 转账的代币数量
     * public: 外部和合约内部都可以调用
     * returns (bool success): 函数返回一个布尔值，表示是否转账成功。   
     */
    function transferFrom(address from, address to, uint256 value) public returns (bool success) {
        require(balanceOf[from] >= value, "Insufficient balance");
        //代币拥有者 from 授权给调用者msg.sender；判断是否有权限
        require(allowance[from][msg.sender] >= value, "Allowance exceeded");
        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }
}