//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Increment{
    uint count;

    function increment(uint num) public{
        
        count = num;
        count += 1;
        require(count < 10, "Count cannot go more than 10");
        
        
    }

    function retrieve() public view returns(uint){
        return count;
    }
}
