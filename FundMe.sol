//Get a Fund
//WIthdraw a fund
// Setting minimum fund in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract FundMe{

    function fund() public payable{
        //Allow user to send usd
        //set minimum usd
        //1. How do wqe send ETH to tbis contract
        require(msg.value > 1e18, "didn't send enough ETH");


    }

    //function withdraw() public {}
    function getPrice() public {

        //Addrss 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI 
    }
    function getConversionRate() public{}
}