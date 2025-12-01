//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract onlyOwnerExample{

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Not Owner");
        _;

    }

    function secretFunction() public onlyOwner{
        //Only Owner calls it
    }

    function changeOwner(address _newOwner) public onlyOwner{
        owner = _newOwner;
    }
}