//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

function sum(uint[] memory arr) pure returns (uint s){
        for (uint i = 0; i < arr.length; i++)
            s += arr[i];
        
}

contract ArrayExample{
    bool found;
    uint public lastSum;
    function f(uint[] memory arr) public{
        uint s = sum(arr);
        require(s>=10);
        lastSum = s;
        found = true;

    }
    function getSum() public view returns(uint){
        return lastSum;
    }
}

contract Simple{
    uint a = 5;
    uint b = 8;
    function arithmetic() public view returns(uint sum1, uint product){
            return (a + b, a * b);
    }
}