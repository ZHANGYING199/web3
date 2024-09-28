// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;



// Events allow logging to the Ethereum blockchain. Some use cases for events are:
// 事件允许记录到 Ethereum 区块链。事件的一些用例包括：

// Listening for events and updating user interface
// 侦听事件和更新用户界面
// A cheap form of storage
// 一种廉价的存储形式

function Event {
    // Event declaration
    // Up to 3 parameters can be indexed.
    // Indexed parameters helps you filter the logs by the indexed parameter

    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "Hello World");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}
