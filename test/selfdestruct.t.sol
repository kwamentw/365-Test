// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {console2} from "forge-std/console2.sol";
import {FamilySubscription} from "../src/selfdestruct.sol";

contract subscriptionTest is Test {
    FamilySubscription subs;

    function setUp() public {
        subs = new FamilySubscription();
    }

    function testDepositSubs() public {
        vm.deal(address(this), 10 ether);
        subs.DepositSubscription{value: 1 ether}();

        vm.deal(address(10), 10 ether);
        vm.prank(address(10));
        subs.DepositSubscription{value: 1 ether}();

        vm.deal(address(20), 10 ether);
        vm.prank(address(20));
        subs.DepositSubscription{value: 1 ether}();

        // vm.deal(address(30), 10 ether);
        // vm.prank(address(30));
        // subs.DepositSubscription{value: 1 ether}();

        // vm.deal(address(40), 10 ether);
        // vm.prank(address(40));
        // subs.DepositSubscription{value: 1 ether}();
    }

    function testCheckSubscription() public {
        subs.checkSubscription();
    }

    function testAttack() public {
        testDepositSubs();
        address payable addr = payable(address(subs));
        selfdestruct(addr);
    }
}
