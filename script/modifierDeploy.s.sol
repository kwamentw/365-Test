//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {ModifierContract} from "../src/modifiers.sol";

/**
 * @title A deploy script
 * @author Kwame 4b
 * @notice Just trying to deploy on a local chain
 */
contract modifierDeploy is Script {
    // function to deploy contract
    function run() external returns (ModifierContract) {
        vm.startBroadcast();
        ModifierContract modify = new ModifierContract();
        vm.stopBroadcast();
        return modify;
    }
}
