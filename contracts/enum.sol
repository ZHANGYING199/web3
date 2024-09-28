// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Enums can be declared outside of a contract.
// 枚举是可以在合同外声明的
contract Enum {
    enum Status {
        Pending,
        shipped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status;
    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4

    function get() public view returns(Status) {
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    function cancel() public {
        status = Status.Canceled;
    }

    function reset() public {
        delete status;
    }
}