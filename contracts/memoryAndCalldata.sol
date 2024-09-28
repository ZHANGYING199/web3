// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


/* 
    storage variable is a state variable (store on blockchain)
    存储变量是一个状态变量（存储在区块链上）
    memory variable is in memory and it exists while a function is being called
    memory 变量位于内存中，并且在调用函数时存在
    calldata special data location that contains function arguments
    calldata 包含函数参数的特殊数据位置 
*/


contract DataLocations {
    uint256[] public arr;
    mapping(uint256 => address) map;

    struct MyStruct {
        uint256 foo;
    }

    mapping(uint256 => MyStruct) myStructs;

    function f() public {
        _f(arr, map, myStructs[1]);

        MyStruct storage myStruct = myStructs[1];

        MyStruct memory myMemStruct = MyStruct(0);

    }
    function _f(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct) internal {
        // do something with storage variables
    }

    function g(uint256[] memory _arr) public returns(uint256[] memory) {
        // do something with memory array
    }

    function h(uint256[] calldata _arr) external{
        // do something with calldata array
    }

}