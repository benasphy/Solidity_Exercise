//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract StoreAgeAndNumber{

    uint public age;
    string public name;
    uint number1;

    function store(uint _age, string memory _name) public{

        age = _age;
        name = _name;

    }

    function updateAge(uint _age) public{

        require(_age > 0, "age can not be less than 0");
        age = _age;
    }


    function iseven(uint _num) public pure returns(string memory){
        if (_num % 2 == 0){
            return "Even";
        }
        else{
            return "Odd";
        }
    }

}