//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract ConstructorExample{

    address public owner;

    constructor(address _owner){
        owner = _owner;
    }
}