//SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {BasicAddition} from "../src/Addition.sol";

contract AdditionTest is Test{
    BasicAddition add;
    uint256 firstVal = 1157920892373161954235709850086879078539984665640564039007913129639935;
    uint256 secondVal = 115792089237316195423570853269984665640564039457584007913129639935;
    uint256 thirdVal = UINT256_MAX;

    function setUp() public {
        add = new BasicAddition();
    }

    function testResultValue() public {
        // to call the addDigits function
        add.addDigits(234,456,444);
        // checking whether results is overflowing or underflowing
        assertLt(add.result(), type(uint256).max);
        assertGt(add.result(), type(uint256).min);
        console.log(add.result());
    }

    function testAddition() public {
        // to call the addDigits function
        add.addDigits(firstVal,secondVal,thirdVal);
        // checking whether the addition is working properly
        assertGt(add.result(), secondVal);
        assertEq(add.result(),firstVal+secondVal+thirdVal);
    }

    function testRequireMessageInAdd() public {
        vm.expectRevert(bytes("Underflow"));
        add.addDigits(firstVal, secondVal, thirdVal);

    }

    function testRevert_error() public {
        vm.expectRevert();
        add.addDigits(firstVal,secondVal,thirdVal);
    }

    function testRequire_OverflowErr() public {
        
    }


}