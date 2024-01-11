// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// importing script for deploy
import {Script} from "forge-std/Script.sol";
// importing script to deploy
import {DonationEvent} from "../src/Events.sol";

/**
 * @title A deploy script for Events.sol
 * @author Kwame 4b
 * @notice My first deploy script
 */
contract DeployEvents is Script{

    /**
     * function to deploy Events.sol
     */
    function run() external returns(DonationEvent){
        // this is the starting bound for what to deploy
        vm.startBroadcast();
        // contract to deploy
        DonationEvent donation = new DonationEvent();
        // this is to stop the broadcast 
        vm.stopBroadcast();
        return donation;
    }
}