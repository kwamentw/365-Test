//SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

/**
 * @title Testing Delegate call
 * @author Kwame4b
 * @notice Just to see whether the values changed as taught
 */
import {Test, console2} from "forge-std/Test.sol";
import {FirstContract, SecondContract} from "../src/Delegate1.sol";

contract TestDelegateCall is Test {
    SecondContract second;
    FirstContract first;

    function setUp() public {
        second = new SecondContract();
        first = new FirstContract();
    }

    function testDelegation() public {
        address fi = address(first);
        second.setVars(fi, 57);
        console2.log(second.num());
        console2.log("Original:", first.num());
    }
}
