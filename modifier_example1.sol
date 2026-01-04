//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract modifierExample{

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner, "Not an Owner");
        _;
    }

    function changeOwner(address newOwner) public onlyOwner{
        owner = newOwner;
    }
}