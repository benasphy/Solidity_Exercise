//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;
type UFixed256x18 is uint256;
library UserDVT{

    uint constant multiplier = 10**18;

    function add(UFixed256x18 a, UFixed256x18 b) internal pure returns(UFixed256x18){
        return UFixed256x18.wrap(UFixed256x18.unwrap(a) + UFixed256x18.unwrap(b));
    }

    function multiply(UFixed256x18 a, uint b) internal pure returns(UFixed256x18){
        return UFixed256x18.wrap(UFixed256x18.unwrap(a) * b);
    }

    function toUFixed256x18(uint a) internal pure returns(UFixed256x18){
        return UFixed256x18.wrap(a * multiplier);
    }
}