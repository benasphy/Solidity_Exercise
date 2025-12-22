//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

function sum(uint[] memory arr) pure returns(uint s){
    for (uint i = 0; i < arr.length; i++){
            s += arr[i];
    }
}

contract FreeFunctionImplementation{

    bool found;
    function f(uint[] memory arr) public{
        uint s = sum(arr);
        require(s >= 10);
        found = true;
    }

    function getSum(uint[] memory arr) public pure returns(uint){
        uint s = sum(arr);
        require(s >= 10);
        return s;
        
    }
}