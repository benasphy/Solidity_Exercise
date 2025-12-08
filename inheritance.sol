//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract Animal{
    string public species;

    function setSpecies(string memory _species) public{
        species = _species;
    }

    function makeSound() public pure virtual returns(string memory){
        return "make some animal sound";
    }
}

contract Dog is Animal{

    function makeSound() public pure override returns(string memory){
        return "Woof";
    }
}