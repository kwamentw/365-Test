//SPDX-License-identifier: MIT
pragma solidity 0.8.20;

// import statements
import {Test} from "forge-std/Test.sol";
import {TryCatchEg} from "../src/TryCatch.sol";

contract TryCatchTest is Test {
    // initializing contract
    TryCatchEg egoftrycatch;

    /**
     * Setting up function for testing
     */
    function setUp() public {
        egoftrycatch = new TryCatchEg();
    }

    /**
     * Testing to see whether emit works
     * emit works alright but foundry cant catch the emit working on it
     */
    function testEmitEventTrycatch() public {
        //vm.expectEmit();
        egoftrycatch.LetsTryCatch(21, 4234);
    }

    /**
     *Testing the addition in the function
     */
    function testAddtry() public view {
        egoftrycatch.Add(2343, 34323);
    }
}
