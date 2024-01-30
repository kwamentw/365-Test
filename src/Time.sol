// SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

contract Time {
    ///// events
    event VoteCasted(address sender);
    event VotingEnded(string);

    ////////////////////////////
    uint256 startTime;
    uint256 endTime;

    constructor() {
        // setting the values
        startTime = block.timestamp + 1 days;
        endTime = block.timestamp + 3 days;
    }

    /**
     * This makes sure the user votes within a period of time
     * @param _sender address of the voter
     */
    function StartVote(address _sender) public {
        require(
            block.timestamp >= startTime &&
                block.timestamp <= endTime &&
                block.number == 5,
            "You can't vote! wrong timing"
        );
        emit VoteCasted(_sender);
    }

    /**
     * User calls this to end the voting if the end time has reached
     */
    function EndVote() public {
        require(
            block.timestamp >= endTime && block.number == 5,
            "Time not yet up to end voting"
        );
        emit VotingEnded("Voting period has ended");
    }
}
