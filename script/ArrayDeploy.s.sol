//SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {ArrayExample} from "../src/Array.sol";

contract DeployArray is Script {
    ArrayExample array;

    function run() public returns (ArrayExample) {
        vm.startBroadcast();
        array = new ArrayExample();
        vm.stopBroadcast();
        return array;
    }
}
