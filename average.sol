//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Median{

    function Average(uint[] memory nums) public pure returns(uint){

        uint sum = 0;
        for (uint i = 0; i < nums.length; i++){
            sum += nums[i];
        }

        return sum / nums.length;
    }


}
