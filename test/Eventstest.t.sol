// SPDX-License-identifier: MIT

pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {DonationEvent} from "../src/Events.sol";

contract DonationEventTest is Test {
    DonationEvent Event;

    event Donate(address indexed donor, uint256 indexed amount, uint256 id);

    function setUp() public {
        Event = new DonationEvent();
    }

    function testEmitEvent() public {
        vm.expectEmit(true, true, false, false);

        emit Donate(address(this), 123, 1);
        Event.Donation(address(this), 123, 1);
    }
}
