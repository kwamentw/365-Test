//SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

// importing necessary dependacies
import {Test} from "forge-std/Test.sol";
import {console2} from "forge-std/console2.sol";
import {ArrayExample} from "../src/Array.sol";

contract ArrayTest is Test {
    // contract to test
    ArrayExample array;

    function setUp() public {
        //setting up the contract for testing
        array = new ArrayExample();
    }

    /**
     * This is to test whether votes are casted & counted
     */
    function testVoting() public {
        array.Vote(0);
        assertEq(array.CheckNoVotes(0), 1);
    }

    /**
     * To check whether the Delete function works on candidates
     */
    function testDeleteCandidate() public {
        array.DelCandidate(1);
        assertLt(array.NoOfCandidates(), 4);
        console2.log(array.NoOfCandidates());
    }

    /**
     * to Test whether we are able to add a new candidate & vote for
     */
    function testAddCandidate() public {
        array.AddCandidate("Inusah");
        assertEq(array.NoOfCandidates(), 5);
    }

    /**
     * To test whether the AllCandidates function works
     */
    function testAllCandidates() public view {
        array.AllCandidates();
    }

    /**
     * to test whether the number of votes are being counted
     */
    function testNoOfVotes() public {
        array.Vote(0);
        array.Vote(0);
        console2.log(array.CheckNoVotes(0));
        assertGt(array.CheckNoVotes(0), 0);
    }

    /**
     * To test whether number of candidates are being counted properly
     */
    function testNoOfCandidates() public {
        console2.log(array.NoOfCandidates());
        assertGt(array.NoOfCandidates(), 0);
    }

    /**
     * To test the require statement
     * this is gas intensive but i just felt require looked cleaner hence its use
     */
    function testRequireMessage_VoteIndex() public {
        vm.expectRevert(bytes("invalid-candidate"));
        array.Vote(78);
    }
}
