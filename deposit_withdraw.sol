//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Account{

    mapping(address => uint) public balances;
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function deposit() public payable{

        require(msg.value > 0, "Must be above 0 ETH");

        balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public{
        require(balances[msg.sender] > _amount, "Insufficient Balance");

        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function checkBalance() public view returns(uint){
        return address(this).balance;
    }
}