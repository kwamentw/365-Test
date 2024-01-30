//SPDX-License-identifier: MIT
pragma solidity 0.8.20;

// import statements
import {Script} from "forge-std/Script.sol";
import {Transact} from "../src/Transact.sol";

/**
 * @title Deploy script for Transact
 * @author kwame 4b
 * @notice deploys to local chain anvil
 */
contract DeployTransact is Script {
    Transact senrec;

    function run() public returns (Transact) {
        vm.startBroadcast();
        senrec = new Transact();
        vm.stopBroadcast();

        return senrec;
    }
}
