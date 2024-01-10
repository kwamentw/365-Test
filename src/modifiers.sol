//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title A contract that deploys basic access control
 * @author KWame 4b
 * @notice This isn't scary but its informative
 */
contract ModifierContract{
    // owner of this contract
    address owner;
    // to verify whether its the owner
    bool public verify = false; 

    constructor(){
        // Owner owning the contract
        owner =msg.sender;
    }

    /**
     * This is where Access control logic is put
     */
    modifier onlyOwner{
        require(owner == msg.sender,"You-cannot-execute-this-contract");
        _;
    }

    /**
     * This is the function that only the owner can call
     */
    function modify() external onlyOwner returns(bool){
        // this variable is to true when owner is able to call the function successfully
        verify = true;
        return verify;
    }
}