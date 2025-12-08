//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract A{

    function getValue() external pure returns(uint){
        return 123;
    }
}

interface IA {
    function getValue() external pure returns(uint);
}

contract B{
    function readValue(address _contractA) external pure returns(uint){
        return IA(_contractA).getValue();
    }
}
