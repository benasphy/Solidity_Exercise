//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Array{

    uint[] num1;

    function Length(uint[] memory _nums) public pure returns(uint length){
        return _nums.length;
    }
    
    function pushNumber(uint _num1) public{
        num1.push(_num1);

    }

    function PopNum() public{
        num1.pop();
    }

    function retrieve() public view returns(uint[] memory){
        return num1;
    }

    function getIndex(uint Index) public view returns(uint){
        return num1[Index];
    }

    function slice(uint start, uint end) public view returns(uint[] memory){

        uint[] memory result = new uint[](end-start);
        uint j = 0;

        for (uint i = start; i < end;){

            result[j] = num1[i];
            i++;
            j++;
        }
        return result;
    }
    
    
    }