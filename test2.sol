//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract test{

    uint public myValue = 1;

    function add() public payable{
        require(msg.value > 1e18, "Not enough balance");
        myValue += 2;
        
    }
}