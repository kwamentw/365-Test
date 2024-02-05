// SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

//import statements
import {Test} from "forge-std/Test.sol";
import {EthConverter} from "../src/EthConverter.sol";
import {console2} from "forge-std/console2.sol";
import {DeployConverter} from "../script/DeployConverter.s.sol";

contract TestConverter is Test {
    //initializing contracts
    EthConverter converter;
    DeployConverter deploycontract;

    /////////////////////////////////
    function setUp() public {
        deploycontract = new DeployConverter();
        converter = deploycontract.run();
    }

    /**
     * Testing the current version of the sepolia pricefeed
     */
    function testVersionn() public {
        uint256 version = converter.getVersionn();
        assertEq(version, 4);
    }

    /**
     * Checking whether pricefeed is working
     */
    function testCurrentPrice() public {
        uint256 currentPrice = converter.getCurrentPrice();
        assertGt(currentPrice, 0);
    }

    /**
     * Testing whether the ETH/USD conversion works
     */
    function testUSDConversion() public {
        uint256 result = converter.ConvertETHToUSD(37);
        assertGe(result, converter.getCurrentPrice());
    }

    /**
     * Testing out the opposite of USD/ETH whether there's something like that
     */
    function testETHConversion() public {
        uint256 result = converter.ConvertUSDToEth(78298);
        console2.log(result);
        assertGt(result, 0);
    }

    /**
     * Testing for a fail when a user inputs an amount lower that eth price in usd
     */
    function testfailETHConversion() public {
        vm.expectRevert();
        converter.ConvertUSDToEth(22);
    }
}
