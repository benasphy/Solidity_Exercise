//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

/*contract People {

    struct Person {
        string name;
        uint age;
    }

    Person[] public people;

    function addPerson(string memory _name, uint _age) public {
        people.push(Person(_name, _age));
    }

    function getPerson(uint index) public view returns(string memory, uint){
        Person storage p = people[index];
        return (p.name, p.age);
    }

}*/

contract userProfiles{

    struct Profile{
        string _username;
        uint reputation;
    }

    mapping(address => Profile) profiles;

    function createProfile(string memory _username) public{
        profiles[msg.sender] = Profile(_username, 1);
    }

    function increaseReputation(address user) public{
        profiles[user].reputation += 1;

    }

}

