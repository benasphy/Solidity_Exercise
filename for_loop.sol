//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract forLoopExercise{   

    function sumNumbers(uint[] memory _nums) public pure returns(uint sum){

        for (uint i = 0; i < _nums.length; i++){
            sum += _nums[i];

        }
        
    }

    
}