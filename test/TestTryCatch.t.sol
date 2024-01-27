//SPDX-License-identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {TryCatchEg} from "../src/TryCatch.sol";

contract TryCatchTest is Test {
    TryCatchEg egoftrycatch;

    function setUp() public {
        egoftrycatch = new TryCatchEg();
    }

    function testEmitEventTrycatch() public {
        vm.expectEmit();
        egoftrycatch.LetsTryCatch(21, 4234);
    }

    function testAddtry() public view {
        egoftrycatch.Add(2343, 34323);
    }
}
