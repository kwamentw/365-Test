// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {console2} from "forge-std/console2.sol";
import {Multiplication} from "../src/multiplication.sol";

contract MultiplicationTest is Test{
    Multiplication multiply;

    function setUp() public {
        multiply = new Multiplication();
    }

    function testUintMultiplication() public {
        multiply.multiplyUint(345,4);
        assertEq(multiply.result(), 345*4);
        assertEq(multiply.result()/345,4);
    }
    function testUintResults() public {
        multiply.multiplyUint(5674,432);
        assertLt(multiply.result(),UINT256_MAX);
    }
    function testZeroMultiply() public {
        multiply.multiplyUint(345,0);
        assertEq(multiply.result(), 0);
    }
    function testExpectRevert_Overflow() public {
        vm.expectRevert(Multiplication.ArithmeticOverUnderflow.selector);
        multiply.multiplyUint(UINT256_MAX,2);
    }

    function testFail_underflow() public {
        multiply.multiplyUint(345,3222);
        assertLt(multiply.result(),0);
    }

    function testIntMultiplication() public {
        multiply.multiplyInt(-234,4);
        assertEq(multiply.results(), -936);
    }
    function testAnotherMultiply() public{
        multiply.multiplyInt(-23,-23);
        assertGt(multiply.results(),0);

    }
    function testZeroMultiplies() public{
        multiply.multiplyInt(-445,0);
        assertEq(multiply.results(),0);
    }
    function testIntMultiplyResults() public {
        multiply.multiplyInt(-345,-998);
        assertLt(multiply.results(),type(int256).max);
        assertGt(multiply.results(),0);
        console2.log(multiply.results());
    }
    function testFailIntMinResults() public{
        multiply.multiplyInt(type(int256).min,2);
    }

    function testRevert_Underflow() public{
        vm.expectRevert();
        multiply.multiplyInt(type(int256).min,2);

    }

}