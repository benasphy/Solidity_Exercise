//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Arithmetic{

    uint x;
    uint y;

    function number(uint _x, uint _y) public{
            x = _x;
            y = _y;
    }

    function ResultofAdd() public view returns(uint){
        return x + y;
    }

    function ReusltofMultiplication() public view returns(uint){
        return x * y;
    }

    function ResultofDivision() public view returns(uint){
        require(y != 0, "y can't be zero because zero division is not allowed!");
        return x / y;
        
    }

    function ResultofAverage() public view returns(uint){
        return (x + y) / 2;
    }
}