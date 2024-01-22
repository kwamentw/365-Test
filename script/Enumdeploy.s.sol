//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

//import statements
import {Script} from "forge-std/Script.sol";
import {TryEnum} from "../src/Enum.sol";

contract Enumdeploy is Script {
    TryEnum enumstatus;

    function run() external {
        vm.startBroadcast();
        enumstatus = new TryEnum();
        vm.stopBroadcast();
    }
}
