// SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

// import statements
import {Script} from "forge-std/Script.sol";
import {OracleRandomNumber} from "../src/ChainlinkRandNumber.sol";

contract DeployOracleRandNumber is Script {
    // initializing consumer contract
    OracleRandomNumber oracle;

    /**
     * Deploying the contract to testnet
     */
    function run() public returns (OracleRandomNumber) {
        vm.startBroadcast();
        oracle = new OracleRandomNumber(9876);
        vm.stopBroadcast();

        return oracle;
    }
}
