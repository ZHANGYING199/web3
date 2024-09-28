// Getter functions can be declared view or pure.
// Getter 函数可以声明 view 为 或 pure 。

// View function declares that no state will be changed.
// View 函数声明不会更改任何状态。

// Pure function declares that no state variable will be changed or read.
// Pure function 声明不会更改或读取任何 state 变量。

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ViewAndPure {


    uint256 public x = 1;
    // Promise not to modify the state.
    function addTox(uint256 y) public view returns(uint256) {
        return x + y;
    }

     // Promise not to modify or read from the state.
     function add(uint256 i, uint256 j) public pure returns(uint256) {
        return i + j;
     }

}