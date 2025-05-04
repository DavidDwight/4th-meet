// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SimpleBank {
    mapping(address => uint256) private balances;

    event Deposit(address indexed account, uint256 amount);
    event Withdraw(address indexed account, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    // Deposit ETH into your internal balance
    function deposit() public payable {
        require(msg.value > 0, "Must deposit more than 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    // Withdraw ETH from your internal balance
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender, amount);
    }

    // Transfer balance to another user's internal account
    function transfer(address to, uint256 amount) public {
        require(to != address(0), "Cannot send to zero address");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
    }

    // Check any user's balance
    function getBalanceOf(address user) public view returns (uint256) {
        return balances[user];
    }
}
