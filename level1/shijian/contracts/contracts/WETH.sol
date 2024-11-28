// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

// 3 个查询
// balanceOf: 查询指定地址的 Token 数量
// allowance: 查询指定地址对另外一个地址的剩余授权额度
// totalSupply: 查询当前合约的 Token 总量
// 2 个交易
// transfer: 从当前调用者地址发送指定数量的 Token 到指定地址。
// 这是一个写入方法，所以还会抛出一个 Transfer 事件。
// transferFrom: 当向另外一个合约地址存款时，对方合约必须调用 transferFrom 才可以把 Token 拿到它自己的合约中。
// 2 个事件
// Transfer
// Approval
// 1 个授权
// approve: 授权指定地址可以操作调用者的最大 Token 数量。

contract WETH {
    event Deposit(address indexed addr, uint256 amount);
    event WithDraw(address indexed addr, uint256 amount);
    event Approval(address indexed addr, address indexed delegateAddr, uint256 amount);
    event Transfer(address indexed addr, address indexed toAddr, uint256 amount);

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    function deposit() public payable {
        balanceOf[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withDraw(uint256 amount) public {
        require(balanceOf[msg.sender] >= amount);
        balanceOf[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit WithDraw(msg.sender, amount);
    }

    function totalSupply() public view returns(uint256) {
        return address(this).balance;
    }

    function approve(address delegateAddr, uint256 amount) public returns(bool) {
        allowance[msg.sender][delegateAddr] = amount;
        emit Approval(msg.sender, delegateAddr, amount);
        return true;
    }

    function transfer(address addr, uint256 amount) public returns(bool) {
        return transerfrom(msg.sender, addr, amount);
    }

    function transerfrom(
        address addr,
        address toAddr,
        uint256 amount
    ) public returns(bool) {
        require(balanceOf[addr] >= amount);
        if(addr != msg.sender) {
            require(allowance[addr][msg.sender] >= amount);
            allowance[addr][msg.sender] -= amount;
        }
        if (addr != msg.sender) {
            require(allowance[addr][msg.sender] >= amount);
            allowance[addr][msg.sender] -= amount;
        }
        balanceOf[addr] -= amount;
        balanceOf[toAddr] += amount;
        emit Transfer(addr, toAddr, amount);
        return true;
    }


    receive() external payable {
        deposit();
    }
}