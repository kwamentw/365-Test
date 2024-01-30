// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

//import statements
import {Test} from "forge-std/Test.sol";
import {Time} from "../src/Time.sol";

contract TimeTest is Test {
    //initializing contract
    Time public time;

    uint256 startAt;
    uint256 endAt;

    /**
     * To set up the contract for testing
     */
    function setUp() public {
        time = new Time();
        startAt = block.timestamp;
        endAt = block.timestamp;
    }

    /**
     * Testing the contract to see whether it fails with the current block time
     */
    function testfailStartVote() public {
        vm.expectRevert(bytes("You can't vote! wrong timing"));
        time.StartVote(msg.sender);
    }

    /**
     * Updating the block time & number to meet conditions for this test
     */
    function testStartVote() public {
        // setting the block.timestamp to what is required
        vm.warp(startAt + 1 days);
        // setting the block number to requirement
        vm.roll(5);
        time.StartVote(msg.sender);
        assertEq(block.number, 5);
        assertEq(block.timestamp, startAt + 1 days);
    }

    /**
     * Expecting this test to fail with the current block time & number
     */
    function testfailEndVote() public {
        vm.expectRevert("Time not yet up to end voting");
        time.EndVote();
    }

    /**
     * Setting all the conditions right to see if it passes
     */
    function testEndVote() public {
        // changing the current block timestamp
        vm.warp(endAt + 3 days);
        // setting the block number
        vm.roll(5);
        time.EndVote();
        assertEq(block.number, 5);
        assertEq(block.timestamp, startAt + 3 days);
    }

    /**
     * Playing with skip and rewing a lil bit
     */
    function testTimeStamp() public {
        uint256 tStamp = block.timestamp;
        // skips block timestamp by 200secs or adds 200s to block timestamp
        skip(200);
        assertEq(block.timestamp, tStamp + 200);
        // rewinds block timestamp 50 secs back
        rewind(50);
        assertEq(block.timestamp, tStamp + 200 - 50);
    }
}
