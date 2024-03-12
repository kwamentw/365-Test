//SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {Dos} from "../src/Dos.sol";

contract DosTest is Test {
    Dos denial;

    function setUp() public {
        denial = new Dos();
    }

    function testAttackDos() public payable {
        denial.claimThrone{value: 1 ether}();
    }

    fallback() external payable {
        assert(false);
    }
}
