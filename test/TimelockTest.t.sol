// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {TimeLock} from "../src/Timelock.sol";
import {console2} from "forge-std/console2.sol";

/**
 * @title A test to invoke Arithmetic overflow/underflow
 * @author KWame4b
 */
contract TimeLockTest is Test {
    TimeLock timelock;

    function setUp() public {
        timelock = new TimeLock();
    }

    receive() external payable {}

    function testdeposit() public {
        vm.deal(address(this), 20 ether);
        timelock.Deposit{value: 10 ether}();
        console2.log(timelock.locktime(address(this)));
    }

    function testwithdraw() public {
        testdeposit();
        vm.warp(block.timestamp + 2 weeks);
        console2.log(timelock.locktime(address(this)));
        timelock.withdraw();
    }

    function testFailwithdraw() public {
        testdeposit();
        //This will revert because lock time is not satisfied
        console2.log(timelock.locktime(address(this)));
        timelock.withdraw();
    }

    //Solidity ^0.8 throws an error whenever Arithmetic overflow/underflow happens
    function testFailattack() public {
        vm.deal(address(this), 20 ether);
        timelock.Deposit{value: 10 ether}();
        timelock.IncreaseLockTIme(
            type(uint256).max + 1 - timelock.locktime(address(this))
        );
        console2.log(timelock.locktime(address(this)));
        timelock.withdraw();
    }
}
