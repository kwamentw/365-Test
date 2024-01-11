// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {console2} from "forge-std/console2.sol";
import {Division} from "../src/Division.sol";

contract DivisionTest is Test {
    Division divide;

    function setUp() public {
        divide = new Division();
    }

    function testDivideUint() public {
        divide.UintDivision(50, 2);
        assertEq(divide.unsignedResults(), (50 / 2));
    }

    function testFail_inputVal() public {
        divide.UintDivision(50, 0);
    }

    function testUintResults() public {
        divide.UintDivision(60, 4);
        assertGt(divide.unsignedResults(), (type(uint256).min));
        assertLt(divide.unsignedResults(), 60);
    }

    function testRequireMessage_Overflow() public {
        vm.expectRevert(bytes("Max-input-Err"));
        divide.UintDivision(UINT256_MAX, 2);
    }

    function testRequireMessage_DivideZero() public {
        vm.expectRevert(bytes("Cannot-divide-by-zero"));
        divide.UintDivision(23, 0);
    }

    function testRequireMessage_FloatvalErr() public {
        vm.expectRevert(bytes("Results-is-floatValue-not-zero"));
        divide.UintDivision(3, 22);
    }

    function testDivideInt() public {
        divide.intDivision(-32, -2);
        assertEq(divide.signedResults(), (-32 / -2));
    }

    function testIntResults() public {
        divide.intDivision(222, -2);
        assertLt(divide.signedResults(), 222);
        assertGt(divide.signedResults(), type(int256).min);
    }

    function testAllNegInput() public {
        divide.intDivision(-222, -2);
        assertGt(divide.signedResults(), -222);
        assertLt(divide.signedResults(), type(int256).max);
    }

    function testRequireMessage_Underflow() public {
        vm.expectRevert(bytes("Underflow"));
        divide.intDivision(-23, type(int256).min);
    }

    function testRequireMessage_ZeroDivide() public {
        vm.expectRevert(bytes("Cannot-divide-by-zero"));
        divide.intDivision(-45, 0);
    }

    function testRevert_Results() public {
        vm.expectRevert();
        divide.intDivision(-34, -3982);
    }
}
