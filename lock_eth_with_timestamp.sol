//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract timeLock{

    address public owner;
    uint public unlockTime;

    constructor(uint _lockDurationInSeconds) payable{
        owner = msg.sender;
        unlockTime = block.timestamp + _lockDurationInSeconds;
    }

    function withdraw() public{
        require(msg.sender == owner, "Not an Owner");
        require(block.timestamp >= unlockTime, "still Locked");

        payable(owner).transfer(address(this).balance);
    }

    function getCurrentTime() public view returns(uint){
        return block.timestamp;
    }
}