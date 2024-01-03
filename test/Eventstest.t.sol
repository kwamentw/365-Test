// SPDX-License-identifier: MIT

pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {VotingEvent} from "../src/Events.sol";

contract VotingEventTest is Test {
     VotingEvent public Event;
    enum Candidate{Aguan, Toska, Jamalord}
    uint256 counter;
    event Vote (address indexed Voter, Candidate candidate, uint256 counter);


    function setUp() public {
         Event = new VotingEvent();
    }

    function testEmitEvent() public {
        vm.expectEmit(true,false,false,true);
        emit Vote(address(1), Candidate.Toska, counter);
        Event.voting(VotingEvent.Candidate(2));
    }
}