
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VotingEvent{
    // this is a contract that teaches me how to test events
    // Might be updated later for advanced techniques

    //Anyway this was the idea of ChatGPT

    enum Candidate{Aguan, Toska, Jamalord}
    event Vote (address indexed Voter, Candidate candidate, uint256 counter);
    uint256 TotalnoVotes;
    address voter;
    uint256 counter;

    constructor(){
      counter = 0;
    }

    function voting( Candidate _candidate) public {
        // checks so that no one votes twice
        require(voter!=msg.sender,"You cannot vote twice");
        // Vote casted
        emit Vote( msg.sender, _candidate, TotalnoVotes);
        // Vote counted
        counter++;

        voter = msg.sender;

        //Total number of votes stored
        TotalnoVotes= counter;
    }

}