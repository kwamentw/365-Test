//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// import statements
import {Script} from "forge-std/Script.sol";
import {MappingConEx} from "../src/Mappings.sol";

contract MappingsDeploy is Script {
    // initializing contract to be deployed on local chain
    MappingConEx mappin;

    function run() external returns (MappingConEx) {
        // Deploy
        vm.startBroadcast();
        mappin = new MappingConEx();
        vm.stopBroadcast();
        return mappin;
    }
}
