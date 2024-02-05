// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./Helperconfig.s.sol";
import {EthConverter} from "../src/EthConverter.sol";

contract DeployConverter is Script {
    HelperConfig config;
    EthConverter converter;

    function run() public returns (EthConverter) {
        config = new HelperConfig();
        address pricefeed = config.activeNetworkCOnfig();

        vm.startBroadcast();
        converter = new EthConverter(pricefeed);
        vm.stopBroadcast();
        return converter;
    }
}
