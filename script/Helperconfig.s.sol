// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// import statements
import {Script} from "forge-std/Script.sol";

contract HelperConfig is Script {
    // initializing networkConfig
    NetworkConfig public activeNetworkCOnfig;

    /**
     * Creating a custom data type to hold address of pricefeed
     */
    struct NetworkConfig {
        address pricefeed;
    }

    /**
     *  Selects the appropriate chain in use
     */
    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkCOnfig = getSepoliaNetworkConfig();
        } else {
            activeNetworkCOnfig = getOrCreateAnvilConfig();
        }
    }

    /**
     * Uses the sepolia fork url i.e simulates the txn on sepolia
     */
    function getSepoliaNetworkConfig()
        public
        pure
        returns (NetworkConfig memory sepoliaNetworkConfig)
    {
        sepoliaNetworkConfig = NetworkConfig({
            pricefeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });

        return sepoliaNetworkConfig;
    }

    /**
     * This runs the contract on local chain
     */
    function getOrCreateAnvilConfig()
        public
        returns (NetworkConfig memory anvilNetworkConfig)
    {}
}
