//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract SimpleStorage{
    address public owner;
    uint storedData;

    constructor(){
        msg.sender == owner;
    }
    function set(uint x) public{
        require(msg.sender == owner, "Not an Owner");
        storedData = x;
    }

    function get() public view returns(uint){
        return storedData;
    }

}