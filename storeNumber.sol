//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StoreandRetrieve{

    uint[] number;

    function store(uint[] memory _num) public{
        number = _num;
    }

    function retrieve() public view returns(uint[] memory){
        return number;
    }

    function updatesStoredNumber(uint[] memory _num) public{
        number = _num;
    }
}




