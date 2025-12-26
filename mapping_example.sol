//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract MappingExample{

    mapping(address => uint) public balances;

    function update(uint _newBalances) public{
        balances[msg.sender] = _newBalances;
    }
}

contract MappingUser{
    function f() public returns(uint){
        MappingExample m = new MappingExample();
        m.update(100);
        return m.balances(address(this));
    }
}

contract MappingUser1{
    MappingExample public m;   // 👈 STORED reference

    constructor() {
        m = new MappingExample();  // 👈 created ONCE
    }

    function f() public returns (uint) {
        m.update(100);
        return m.balances(address(this));
    }

    function getMyBalance() public view returns (uint) {
        return m.balances(address(this));
    }
}

