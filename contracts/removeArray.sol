// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


contract ArrayRemoveByShifting {
      // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []

    // 通过将元素从右向左移动来删除数组元素

    uint256[] public arr;

    function remove(uint256 _index) public {
        require(_index < arr.length, "index out of bound");

        for (uint256 i = _index; i < arr.length - 1; i ++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test() external {
        arr = [1,2,3,4,5];
        remove(2);
        // [1, 2, 4, 5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);  // assert() 这个是断言方法
        assert(arr.length == 4); 
        // 这行代码是一个断言（assertion），用于检查数组 arr 的长度是否为 4。如果数组 arr 的长度确实为 4，那么这个断言就不会有任何问题，
        // 程序会继续正常执行。但是，如果数组 arr 的长度不是 4，那么这个断言就会失败，程序会抛出一个异常，通常是 AssertionError，并且程序会终止执行。

        // 断言是一种在开发和调试阶段常用的调试工具，它们用于检查程序中的某些假设或条件是否成立。通过在代码中插入断言，开发者可以确保程序的各个部分按照预期工作，
        // 如果出现不符合预期的状况，断言可以帮助开发者快速定位问题

        arr = [1];
        remove(0);
        // []
        assert(arr.length == 0);
    }


}