// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {ModifierContract} from "../src/modifiers.sol";

contract modifierTest is Test{
    ModifierContract mod;
    address user = makeAddr("USER");

    // setting up contract for testing 
    function setUp() public {
        mod = new ModifierContract();
    }

    // Testing whether owner can call function successfully
    function testMod() public {
        mod.modify();
        assertTrue(mod.verify());
    }

    // Testing whether other users can run the function
    function testRequireMessage_Mod() public {
        vm.prank(user);
        vm.expectRevert(bytes("You-cannot-execute-this-contract"));
        mod.modify();
    }
}