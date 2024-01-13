//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// importing script to facilitate deploy
import {Script} from "forge-std/Script.sol";
// importing the contract to deploy
import {BasicAddition} from "../src/Addition.sol";

/**
 * @title A script to deploy Additon.sol
 * @author Kwame 4b
 * @notice My second deploy script, still pretty basic.
 */
contract AdditionDeploy is Script {
    function run() external returns (BasicAddition) {
        // starts to deploy the contract specified
        vm.startBroadcast();
        BasicAddition add = new BasicAddition();
        // ends broadcast of what to deploy
        vm.stopBroadcast();

        return add;
    }
}
