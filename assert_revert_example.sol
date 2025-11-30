//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract AssertRevertExample{

    uint public value;
    uint public totalSupply = 100;

    function setValue(uint _val) public{

        if (_val <= 10){
                revert("Value must be greater than 10");
        }
        value = _val;
    }

    function reduceSupply(uint _amount) public{

        totalSupply -= _amount;

        assert(totalSupply >= 0);
    }
}