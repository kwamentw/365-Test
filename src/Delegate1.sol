// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract FirstContract {
    address public owner;

    function pwn() public {
        owner = msg.sender;
    }
}

contract SecondContract {
    address public owner;
    FirstContract public first;
}
