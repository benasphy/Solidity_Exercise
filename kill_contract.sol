//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract killContract{

        address public owner;

        constructor(){
            owner = msg.sender;
        }

        modifier onlyOwner(){
            require(msg.sender == owner, "Not Owner");
            _;
        }

        function killcontract() public onlyOwner{
            selfdestruct(payable(owner));
        }

        receive() external payable{}
}