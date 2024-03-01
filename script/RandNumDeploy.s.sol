// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {RandomNumber} from "../src/RandomNumber.sol";
import {Script} from "forge-std/Script.sol";

contract RandNumDeploy is Script {
    RandomNumber rand;

    function run() public returns (RandomNumber) {
        vm.startBroadcast();
        rand = new RandomNumber();
        vm.stopBroadcast();

        return rand;
    }
}
