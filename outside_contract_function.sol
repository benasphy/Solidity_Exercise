//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract Test{

    function run(uint y) public pure returns(uint){
        return double(y);
    }

}

function double(uint x) pure returns(uint){
    return x * 2;
}