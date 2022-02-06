// SPDX-License-Identifier: WCY

pragma solidity ^0.8.11;

contract A {
    string internal name;

    constructor(string memory _name) {
        name = _name;
    }

    function getValue_A() public view virtual returns (string memory) {
        return name;
    }
}

// 通过继承的同时直接给A传参
contract B is A("a's constructor way 2") {
    // 通过A的构造函数给A传参
    // constructor() A("a's constructor way 1") {
    // }
    // 通过b的构造函数给A传参
    // constructor(string memory _name) A(_name) {
    // }
    //  function getValue_A() public pure override(A) returns (string memory) {
    //      return "AB";
    //  }
    //  function getValue_B() public pure returns (string memory) {
    //      return getValue();
    //  }
}
