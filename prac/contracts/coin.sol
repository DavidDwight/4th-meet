// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract SimpleBank {
    mapping(address => uint) private balances;

    function setBalance(address user, uint amount) public {
        balances[user] = amount;
    }

    function getBalance(address user) public view returns (uint) {
        return balances[user];
    }

    function increaseBalance(address user, uint amount) public {
        balances[user] += amount;
    }

    function decreaseBalance(address user, uint amount) public {
        require(balances[user] >= amount, "Insufficient Balance");
        balances[user] -= amount;
    }
}