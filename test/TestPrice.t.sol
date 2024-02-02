// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// import statements
import {Test} from "forge-std/Test.sol";
import {PriceEth} from "../src/Prices.sol";
import {DeployPrices} from "../script/PricesDeploy.s.sol";

contract TestPrice is Test {
    //initializing contracts
    PriceEth currPrice;
    DeployPrices deployP;

    /**
     * Setting uo contracts
     */
    function setUp() public {
        //0x1804c8ab1f12e6bbf3894d4083f33e07309d1f38
        deployP = new DeployPrices();
        currPrice = deployP.run();
    }

    /**
     * Testing whether we can get cuurent price of the sepolia address
     */
    function testPriceFeed() public {
        currPrice.getETHUSDCurrentPrice();
        assertGt(currPrice.getETHUSDCurrentPrice(), 0);
    }

    /**
     * Checking the version in use
     */
    function testPriceFeedVersion() public {
        uint256 version = currPrice.getVersion();
        assertGt(version, 1);
    }
}
