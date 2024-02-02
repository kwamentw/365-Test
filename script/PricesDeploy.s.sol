// SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

// import statements
import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./Helperconfig.s.sol";
import {PriceEth} from "../src/Prices.sol";

/**
 * @notice Deploys the PriceEth contract on the selected chain
 */
contract DeployPrices is Script {
    // initializing contracts
    HelperConfig config;
    PriceEth price;

    /**
     * Deploys the PriceEth contract
     */
    function run() external returns (PriceEth) {
        config = new HelperConfig();
        address priceFeed = config.activeNetworkCOnfig();

        vm.startBroadcast();
        price = new PriceEth(priceFeed);
        vm.stopBroadcast();

        return price;
    }
}
