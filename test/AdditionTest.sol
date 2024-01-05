//SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {BasicAddition} from "../src/Addition.sol";

contract AdditionTest is Test{
    BasicAddition add;
    
    function setUp() public {
        add = new BasicAddition();
    }

    function testResulVar() public {
        add.addDigits(234,456,444);
        assertLt(add.result(), type(uint256).max);
        console.log(add.result());
    }
}