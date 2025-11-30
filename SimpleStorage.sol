// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract SimpleStorage{

    uint256 favoriteNumber;

    struct Person{
        uint256 myFavoriteNumber;
        string name;
    }
    Person public ben = Person(10, "Benjamin");
    Person[] public listOfPeople;
    
    
    mapping(string => uint256) public nameToFavoriteNumber;
    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }

    function retrieves() public view returns(uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _myfavoriteNumber) public{
        listOfPeople.push(Person(_myfavoriteNumber, _name));
        nameToFavoriteNumber[_name] = _myfavoriteNumber;
    }
}

contract SimpleStorage2{
    
}