//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract Animal {
    function sound() public virtual returns (string memory) {
        return "Animal sound";
    }
}

contract Dog is Animal {
    function sound() public override returns (string memory) {
        return "Bark";
    }
}

contract Cat is Animal {
    function sound() public override returns (string memory) {
        return "Meow";
    }
}

contract Test {
    function makeSound(Animal a) public returns (string memory) {
        return a.sound();
    }
}
