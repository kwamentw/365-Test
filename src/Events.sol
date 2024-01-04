
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DonationEvent{
    // this is a contract that teaches me how to test events
    // Might be updated later for advanced techniques

    //Anyway this was the idea of ChatGPT

    event Donate (address indexed donor, uint256 indexed amount, uint256 id);
    
    function Donation(address _donor, uint256 amount, uint256 _id) external {
        // donation done
        _donor = msg.sender;

        emit Donate( _donor, amount, _id);
    }

}