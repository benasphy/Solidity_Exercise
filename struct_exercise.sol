//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract StructExercise{

    struct Student{
        string name;
        uint age;
        uint score;
    }
    Student[] public students;

    function addStudents(string memory _name, uint _age, uint _score) public{
        students.push(Student(_name, _age, _score));
    }

    //Update an item by array index

    function updateBYIndex(uint _index, string memory _name, uint _age, uint _score) public{
        students[_index].name = _name;
        students[_index].age = _age;
        students[_index].score = _score;

    }
}