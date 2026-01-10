//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract hashingStrings{

    function hashString(string memory s) public pure returns(bytes32){
        return keccak256(abi.encodePacked(s));
    }

    //String comparison

    function equal(string memory _a, string memory _b) public pure returns(bool){
        return keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked(_b));
    }

    //collision example and to avoid encodepacked

    function collision() public pure returns(bool){
        return keccak256(abi.encodePacked("ab", "c")) == keccak256(abi.encodePacked("a", "bc"));
    }
    function collision2() public pure returns(bool){
        return keccak256(abi.encode("ab", "c")) == keccak256(abi.encode("a", "bc"));
    }
}



