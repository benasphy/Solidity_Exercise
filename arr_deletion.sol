//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract ArrayDeletion{

    uint[] public arr;

    function addArr(uint _arr) public{
        arr.push(_arr);
    }

    function remove(uint index) public{
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
    
}