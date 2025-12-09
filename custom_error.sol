//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract customError{
    mapping(address => uint) public balances;
    address public owner;

    error notOwner();
    error InsufficientBalance(uint required, uint available);

    constructor(){
        msg.sender == owner;
    }

    receive() external payable{
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public{
        if (msg.sender != owner) revert notOwner();

        uint available = address(this).balance;

        if (amount > available)
            revert InsufficientBalance(amount, available);
        
        payable(owner).transfer(amount);
    }
}
