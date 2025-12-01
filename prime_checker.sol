//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PrimeNumberChecker{

    function PrimeChecker(uint _num) public pure returns(string memory _Prime){

        if (_num <= 1) return "Not Prime";
        if (_num == 2) return "Prime";
        if (_num % 2 == 0) return "Not Prime";

        for (uint i = 3; i * i <= _num;){

            if (_num % i == 0) return "Not Prime";
            i += 2;
        }
        return "Prime";

    }
}

contract SimpleHelloWOrld{

    function PrintHelllo() public pure returns(string memory _print){
        return "Hello World";
    }
}

contract MaxChecker{

    function MaxofNumber(uint _a, uint _b) public pure returns(uint max){
        if (_a > _b) return _a;
        if (_b > _a) return _b;

    }
}