// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {PrivateData} from "../src/PrivateData.sol";

contract PrivateDataDeploy is Script {
    PrivateData privateda;

    function run() public returns (PrivateData) {
        vm.startBroadcast();
        privateda = new PrivateData("letsgo");
        vm.stopBroadcast();

        return privateda;
    }
}
