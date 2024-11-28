// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;


contract HelloWorld {
    string storeMsg;

    function set(string memory message) public {
        storeMsg = message;
    }

    function get() public view returns(string memory) {
        return storeMsg;
    }
}