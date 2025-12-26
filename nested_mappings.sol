//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract NestedMapping{
    mapping(address => mapping(address => uint)) private _allowance;

    function allowance(address spender, uint _amount) public{
        _allowance[msg.sender][spender] = _amount;
    }

    function getBalance(address owner, address spender) public view returns(uint){
        return _allowance[owner][spender];
    }
}