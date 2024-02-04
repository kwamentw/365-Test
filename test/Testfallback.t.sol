// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

//import statements
import {Test} from "forge-std/Test.sol";
import {FallbacTry} from "../src/Fallback.sol";

// to trigger the fallback function
contract TestFallback is Test {
    FallbacTry public fall;

    // setting up
    function setUp() public {
        fall = new FallbacTry();
    }

    // To trigger the fallback
    function testFallback() public {
        // vm.expectEmit();
        hoax(address(333), 343);
        // transfer
        payable(address(fall)).transfer(30);
    }
}
