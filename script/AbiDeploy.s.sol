//SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

//import statements
import {Script} from "forge-std/Script.sol";
import {AbiEncodeExample} from "../src/AbiEncode.sol";

contract DeployAbiexample is Script {
    //initialing contract
    AbiEncodeExample abienc;

    /**
     * Deploying the initialized contract
     */
    function run() external returns (AbiEncodeExample) {
        vm.startBroadcast();
        abienc = new AbiEncodeExample();
        vm.stopBroadcast();
        return abienc;
    }
}
