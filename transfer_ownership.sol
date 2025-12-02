//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract transferOwnership{

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(owner == msg.sender);
        _;
    }

    
    function changeOwner(address _newOwner) public onlyOwner{
        owner = _newOwner;
    }
}