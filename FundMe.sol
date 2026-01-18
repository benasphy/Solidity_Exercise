//Get a Fund
//WIthdraw a fund
// Setting minimum fund in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract FundMe{

    function fund() public payable{
        //Allow user to send usd
        //set minimum usd
        //1. How do we send ETH to this contract
        require(msg.value > 1e18, "didn't send enough ETH");


    }

    //function withdraw() public {}
    function getPrice() public {

        //Addrss
        //ABI 
    }
    function getConversionRate() public{}
}
