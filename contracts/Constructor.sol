// A constructor is an optional function that is executed upon contract creation.
// 构造函数是在创建合约时执行的可选函数。

// Here are examples of how to pass arguments to constructors.
// 以下是如何将参数传递给构造函数的示例。

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract X {
    string public name;
    constructor(string memory _name) {
        name = _name;
    }
}

contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// There are 2 ways to initialize parent contract with parameters.

// Pass the parameters here in the inheritance list.

contract B is X("Input to X"), Y("Input to Y") {}


contract C is X, Y {
    // Pass the parameters here in the constructor,
    // similar to function modifiers.
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}

contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}