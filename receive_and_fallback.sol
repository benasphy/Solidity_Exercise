//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract ReceiveEther{

    receive() external payable{}

    fallback() external payable {}

    function getAmount() public view returns(uint){
        return address(this).balance;
    }
}