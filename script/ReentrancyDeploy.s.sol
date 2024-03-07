// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {ReenterProne} from "../src/ReentrancyProne.sol";

/**
 * @title Deploy script for ReenterProne
 * @author Kwame4b
 * @notice just trying to understand these things
 */
contract DeployProne is Script {
    ReenterProne prone;

    function run() public returns (ReenterProne) {
        vm.startBroadcast();
        prone = new ReenterProne();
        vm.stopBroadcast();

        return prone;
    }
}
