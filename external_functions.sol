//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract externalFUnctionExample{
    function foo(uint x) external pure returns(uint){
        return x*2;
    }
    function callfoo() public view returns(uint){
        return this.foo(10);
    }
}