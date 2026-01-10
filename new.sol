//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract UserWallet{
    address public owner;

    constructor(address _owner){
        owner = _owner;
    }
}

contract walletFactory{
    mapping(address => address) wallets;

    function create() public{
        wallets[msg.sender] = address(new UserWallet(msg.sender));
    }
}