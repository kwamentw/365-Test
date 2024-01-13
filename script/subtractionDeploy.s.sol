// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// importing script to facilitate deploy
import {Script} from "forge-std/Script.sol";
// importing the contract to deploy
import {BasicSubtraction} from "../src/subtraction.sol";

/**
 * @title A script to deploy subtraction.sol
 * @author Kwame 4b
 * @notice Another deploy script, just because i can.
 */
contract SubtractionDeploy is Script {
    function run() external returns(BasicSubtraction) {
        // starts broadcast of what to deploy
        vm.startBroadcast();
        BasicSubtraction subtract = new BasicSubtraction();
        // ends broadcast of what to deploy
        vm.stopBroadcast();
        return subtract;
    }
}