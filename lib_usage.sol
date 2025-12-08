//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

import './Math_Lib.sol';
contract Addition{
 
    function add(uint x, uint y) public pure returns(uint){
        return MathLib.add(x, y);
    }

}

