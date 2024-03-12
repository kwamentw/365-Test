//SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {Dos} from "../src/Dos.sol";

contract DosTest is Test {
    Dos denial;

    function setUp() public {
        denial = new Dos();
    }

    /**
     * Seems that if you hit it with the assert there will be a DOS
     */

    function testAttackDos() public payable {
        vm.deal(address(this), 5 ether);
        vm.prank(address(this));
        denial.claimThrone{value: 3}();
        assert(false);
    }
}
