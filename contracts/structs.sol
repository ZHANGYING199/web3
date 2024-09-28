// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 结构可以在合约之外声明，也可以在另一个合约中导入
contract todos {
    struct Todo {
        string text;
        bool completed;
    }
    Todo[] public todoss;
    // this declaration shadows an existing declaration .  重复定义

    function create(string calldata _text) public {
        // 3 ways to initialize a struct
        // - calling it like a function
        todoss.push(Todo(_text, false));

        // key value mapping
        todoss.push(Todo({text: _text, completed: false}));

        // initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        // todo.completed initialized to false

        todoss.push(todo);
    }

    function get(uint256 _index) public view returns(string memory text, bool completed) {
        Todo storage todo = todoss[_index];
        return (todo.text, todo.completed);
    }

    function undateText(uint256 _index, string calldata _text) public {

        Todo storage todo = todoss[_index];
        todo.text = _text;
    }

    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todoss[_index];
        todo.completed = !todo.completed;
    }
}