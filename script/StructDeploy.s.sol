//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {structExample} from "../src/Struct.sol";

contract structDeploy is Script {
    structExample structs;

    function run() public returns (structExample) {
        // a function to deploy the contract on local chain that is anvil
        vm.startBroadcast();
        structs = new structExample();
        vm.stopBroadcast();
        return structs;
    }
}
