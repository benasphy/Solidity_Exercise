//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract ReceiveExample{
    uint public result;

    receive() external payable{
        result = 1;
    }
}