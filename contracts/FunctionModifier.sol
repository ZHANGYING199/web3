// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Modifiers are code that can be run before and / or after a function call.

// Modifiers can be used to:
// 修饰符可用于：

// Restrict access 限制访问
// Validate inputs 验证输入
// Guard against reentrancy hack
// 防止重入黑客攻击


contract FunctionModifier {
    // We will use these variables to demonstrate how to use
    // modifiers.

    address public owner;
    uint256 public x = 10;
    bool public lock;

    constructor() {
        // Set the transaction sender as the owner of the contract.
        owner = msg.sender;

    }

      // Modifier to check that the caller is the owner of
    // the contract.

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
           // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    
    // Modifiers can take inputs. This modifier checks that the
    // address passed in is not the zero address.

    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _; 
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
       owner = _newOwner;
    }


}