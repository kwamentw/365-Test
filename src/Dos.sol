// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Dos {
    address public king;
    uint256 public balance;

    function claimThrone() external payable {
        require(msg.value > balance, "You need to pay more to become the king");
        (bool sent, ) = king.call{value: balance}("");
        require(sent, "Failed to send ether");

        balance = msg.value;
        king = msg.sender;
    }
}
