//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract sendEther{

    function sendETH(address payable _to) public payable{

        require(msg.value > 0, "Must be greater than 0");
        _to.transfer(msg.value);

    }

}