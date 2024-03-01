// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

//import scripts
import {RandomNumber} from "../src/RandomNumber.sol";
import {Script} from "forge-std/Script.sol";

contract RandNumDeploy is Script {
    //initializing contract
    RandomNumber rand;

    /**
     * Deploying contract to local chain
     */
    function run() public returns (RandomNumber) {
        vm.startBroadcast();
        rand = new RandomNumber();
        vm.stopBroadcast();

        return rand;
    }
}
