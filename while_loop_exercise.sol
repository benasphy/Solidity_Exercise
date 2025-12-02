//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract whileLoopExercise{

    function countOneToTen() public pure returns(uint[] memory){

        uint i = 0;
        uint[] memory arr = new uint[](10);

        while (i < 10){
            arr[i] = i+1;
            i++;
        }
        return arr;
    }
    
}