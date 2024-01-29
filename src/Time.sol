// SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

contract Time {
    event VoteCasted(address sender);
    event VotingEnded(string);
    uint256 startTime;
    uint256 endTime;

    constructor() {
        startTime = block.timestamp + 1 days;
        endTime = block.timestamp + 3 days;
    }

    function StartVote(address _sender) public {
        require(
            block.timestamp >= startTime && block.timestamp <= endTime,
            "You can't vote! wrong timing"
        );
        emit VoteCasted(_sender);
    }

    function EndVote() public {
        require(block.timestamp >= endTime, "Time not yet up to end voting");
        emit VotingEnded("Voting period has ended");
    }
}
