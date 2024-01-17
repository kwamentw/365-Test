//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract ArrayExample {
    address owner;
    string[] public candidates = [
        "Mahameezy",
        "Cheddeezy",
        "Bawumeezy",
        "Alaneezy"
    ];
    uint256[] public voteCounter;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "unauthorised user");
        _;
    }

    function Vote(uint256 index) public {
        //Please enter the candidates position on the ballot to vote!
        require(index < candidates.length, "invalid candidate");
        voteCounter[index]++;
    }

    function AddCandidate(string memory newCandidate) external onlyOwner {
        candidates.push(newCandidate);
    }

    function DelCandidate(uint256 index) public onlyOwner {
        candidates[index] = candidates[candidates.length - 1];
        candidates.pop();
    }

    function AllCandidates() public view returns (string[] memory) {
        return candidates;
    }

    function CheckNoVotes(
        uint256 index
    ) public view onlyOwner returns (uint256) {
        return voteCounter[index];
    }

    function NoOfCandidates() public view returns (uint256) {
        return candidates.length;
    }
}
