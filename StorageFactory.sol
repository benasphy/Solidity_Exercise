// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public listOfSimpleStorageContract;

    function createSimpleStorage() public{
        SimpleStorage simpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContract.push(simpleStorageContract);
    }
}




