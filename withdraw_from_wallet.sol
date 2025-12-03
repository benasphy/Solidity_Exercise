//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract withdrawFromWallet{

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Not Owner");
        _;
    }
    receive() external payable{}

    function withdraw(uint _amount) public payable{

        require(address(this).balance >= _amount, "Insufficient Balance");
        payable(owner).transfer(_amount);
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}