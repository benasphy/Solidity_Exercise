//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Toggle{

    bool flag;

    function ToggleBoolean() public{

        flag = !flag;
    }

    function retrieve() public view returns(bool){
        return flag;
    }
}
