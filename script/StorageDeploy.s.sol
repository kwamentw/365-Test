//SPDX-License-identifier: MIT
pragma solidity 0.8.20;

// importing script to help deploy
import {Script} from "forge-std/Script.sol";
// importing the contract to deploy
import {BasicStorage} from "../src/BasicStorage.sol";

/**
 * @title A Script that deploys BasicStorage.sol
 * @author Kwame 4b
 * @notice i will deploy like a pro
 */
contract StorageDeploy is Script {
    function run() external returns (BasicStorage) {
        // starts to deploy the contract specified
        vm.startBroadcast();
        BasicStorage store = new BasicStorage();
        // ends broadcast of what to deploy
        vm.stopBroadcast();
        return store;
    }
}