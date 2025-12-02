//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StoreString{

    string text;

    function storeString(string memory _t) public{
        text = _t;
    }
    function getString() public view returns(string memory){
        return text;
    }
}

