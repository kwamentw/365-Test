// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title A contract that sends and receives ETHER
 * @author Kwame 4b
 * @notice Just a simple hands-on
 */
contract Transact {
    /////////////////////////////////
    event Status(string);
    /////////////////////////////////
    address public owner;

    /////////////////////////////////
    /**
     * initializing the owner of the contract
     */
    constructor() {
        owner = payable(msg.sender);
    }

    /////////////////////////////////

    /**
     * Function to receive ETH
     */
    receive() external payable {}

    /**
     * A function that sends eth to the specified address
     * @param _to Address we are sending ETH to
     * @param amount Amount of ETH we want to send
     */
    function SendEth(address payable _to, uint256 amount) public payable {
        // making sure only the owner can call this function
        require(owner == msg.sender, "you are not the owner");
        // checking for an invalid address
        require(_to != address(0), "Invalid-address");
        // making sure the owner cannot send an invalid amount
        require(amount > 0, "You cannot send nothing");

        // alternate methods you can use to transfer eth
        // _to.transfer(msg.value);
        // (bool ok) = _to.send(msg.value);
        // require(ok,"Your transaction didn't go through");

        //Decided to use this because it has been recommended by the community since 2019
        (bool ok, ) = _to.call{value: amount}("");
        // catching reverts incase the transaction fails
        require(ok, "Your transaction failed");
        emit Status("You have sent some ETH");
    }

    /**
     * A function that helps the owner withdraw eth sent to the contract
     * @param amount Amount to withdraw
     */
    function withdraw(uint256 amount) public payable {
        //access control
        require(owner == msg.sender);
        (bool ok, ) = payable(owner).call{value: amount}("");
        require(ok, "transaction failed");
        emit Status("You have withdrew some ETH");
    }

    /**
     * A function to check the balance of this contract
     */
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
