//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

interface IExternal{
    function risky() external;
}

contract tryCatch{

    function callexternal(address target) external{
        try IExternal(target).risky(){
            //DO Nothing
        }
        catch{
            //Do Nothing
        }
    }
}