//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title An Array contract on voting
 * @author Kwame 4b
 * @notice This is gas intensive i Know! but i just want to solidify my knowledge on Arrays thats why i did this
 */
contract ArrayExample {
    // owner of the contract
    address owner;
    // candidates in the election
    string[] public candidates = [
        "Mahameezy",
        "Cheddeezy",
        "Bawumeezy",
        "Alaneezy"
    ];
    // counts votes of each candidate
    uint256[] public voteCounter = [0, 0, 0, 0];

    constructor() {
        //setting owner of contract
        owner = msg.sender;
    }

    // modifiers to enforce access controls
    modifier onlyOwner() {
        require(owner == msg.sender, "unauthorised user");
        _;
    }

    /**
     * This function is used to vote for candidates
     * @param index to get the index of the candidate being voted for
     */
    function Vote(uint256 index) public {
        //Please enter the candidates position on the ballot to vote!
        require(index < candidates.length, "invalid-candidate");
        voteCounter[index]++;
    }

    /**
     * Function deletes candidates off the array
     * @param index to get the desired candidate to pop
     */
    function DelCandidate(uint256 index) public onlyOwner {
        candidates[index] = candidates[candidates.length - 1];
        candidates.pop();
        voteCounter[index] = voteCounter[voteCounter.length - 1];
    }

    /**
     * Adds a new candidate to the ballot
     * @param newCandidate Name of new candidate
     */
    function AddCandidate(string memory newCandidate) external onlyOwner {
        candidates.push(newCandidate);
        voteCounter.push(0);
    }

    /**
     * Prints out all candidates in the Array
     */
    function AllCandidates() public view returns (string[] memory) {
        return candidates;
    }

    /**
     * Checks number of votes for the selected index
     * @param index is used to get candidate
     */
    function CheckNoVotes(
        uint256 index
    ) public view onlyOwner returns (uint256) {
        return voteCounter[index];
    }

    /**
     * This function returns the number of candidates
     */
    function NoOfCandidates() public view returns (uint256) {
        return candidates.length;
    }
}
