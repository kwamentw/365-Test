// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {console2} from "forge-std/console2.sol";
import {BasicSubtraction} from "../src/subtraction.sol";

contract SubtractionTest is Test {
    BasicSubtraction sub;

    // setting up the function for testing
    function setUp() public {
        sub = new BasicSubtraction();
    }

    function testSubtraction() public {
        // call the subtraction function
        sub.subDigits(34522, 234566);
        // testing whether subtraction works
        assertEq(sub.result(), 234566 - 34522);
    }

    function testPositiveResults() public {
        // call subtraction
        sub.subDigits(234, 4567);
        //testing whether answer will be positive
        assertLt(sub.result(), 234566);
    }

    function testAllNegInput() public {
        // call the function
        sub.subDigits(-234, -45657);
        // checking whether the result will be correct
        assertEq(sub.result(), -45423);
    }

    function testZerosub() public {
        // call the function
        sub.subDigits(209, 0);
        // checking subtraction success = true
        assertEq(sub.result(), -209);
    }

    function testNegativeResults() public {
        // call subtraction
        sub.subDigits(2344, 333);
        // testing whether answer will be negative
        assertLt(sub.result(), 0);
    }

    function testRevert_UnderflowError() public {
        // it is a second digit minus the last digit
        vm.expectRevert();
        //testing underflow in final results
        sub.subDigits(222, -57896044618658097711785492504343953926634992332820282019728792003956564819968);
    }

    function testFailOverflowErr() public {
        sub.subDigits(222, 34565);
        assertGt(sub.result(), 57896044618658097711785492504343953926634992332820282019728792003956564819967);
        console2.log(sub.result());
    }

    function testRequire_OverflowErrSub() public {
        vm.expectRevert();
        sub.subDigits(-57896044618658097711785492504343953926634992332820282019728792003956564819967, 65777);
    }
}
