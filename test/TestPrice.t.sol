// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {PriceEth} from "../src/Prices.sol";

contract TestPrice is Test {
    PriceEth currPrice;

    function setUp() public {
        currPrice = new PriceEth();
    }

    function testPriceFeed() public {
        currPrice.getETHUSDCurrentPrice();
        assertGt(currPrice.getETHUSDCurrentPrice(), 0);
    }
}
