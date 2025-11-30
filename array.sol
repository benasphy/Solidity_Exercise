//SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract exercise{
    uint[5] public num = [1,2,3,4,5];
    uint x = num[4];

    function getNum() public view returns(uint){
        return x;
        }
}