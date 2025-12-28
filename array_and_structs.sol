//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract structArray{

    struct Person{
        uint favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    function addPeople(string memory _name, uint _favoriteNumber) public{
        listOfPeople.push(Person(_favoriteNumber, _name));
    }
}