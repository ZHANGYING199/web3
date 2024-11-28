// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract Demo {
    struct Todo {
        string name;
        bool isCompleted;
    }
    Todo[] public list; // 29414
    // 创建任务
    function create(string memory name_) external {
        list.push(
            Todo({
                name: name_, // ,
                isCompleted: false
            })
        );
    }

    function modiName1(uint256 index_, string memory name_) external {
        // 直接修改，修改一个属性比较省gas
        list[index_].name = name_;
    }
    function modiName2(uint256 index_, string memory name_) external {
        Todo storage temp = list[index_];
        temp.name = name_;
    }
    // 修改完成状态1:手动指定完成或者未完成
    function modiStatus1(uint256 index_, bool status_) external {
        list[index_].isCompleted = status_;
    }
    // 修改完成状态2：自动切换toggle
    function modiStatus2(uint256 index_) external {
        list[index_].isCompleted = !list[index_].isCompleted;
    }
    // 获取任务1：memory ： 2次拷贝
    // 29448 gas
    function get1(uint256 index_) external view returns(string memory name_, bool status_) {
        Todo memory temp = list[index_];
        return (temp.name, temp.isCompleted);
    }
    // 获取任务2: storage : 1次拷贝
    // 预期：get2 的 gas 费用比较低（相对 get1）
    // 29388 gas

    function get2(uint256 index_) external view returns(string memory name_, bool status_) {
        Todo storage temp = list[index_];
        return (temp.name, temp.isCompleted);
    }

}