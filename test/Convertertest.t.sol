// SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {EthConverter} from "../src/EthConverter.sol";
import {DeployConverter} from "../script/DeployConverter.s.sol";

contract TestConverter is Test {
    EthConverter converter;
    DeployConverter deploycontract;

    function setUp() public {
        deploycontract = new DeployConverter();
        converter = deploycontract.run();
    }

    function testVersionn() public {
        uint256 version = converter.getVersionn();
        assertEq(version, 4);
    }
}
