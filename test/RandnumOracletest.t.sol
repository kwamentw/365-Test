// SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {OracleRandomNumber} from "../src/ChainlinkRandNumber.sol";
import {DeployOracleRandNumber} from "../script/RandNumOracleDeploy.s.sol";

/**
 * @title Interacting with a random number contract
 * @author Kwame4b
 * @notice Turns out i cannot because cos I'm running into custom error:f0019fe6
 * I will just have to check out mock contracts now
 */

contract TestOracleRandNum is Test {
    // contract declaration
    OracleRandomNumber oracle;
    DeployOracleRandNumber deploy;

    // consumer address
    address consumer = 0x719c307eB941fE516bc7d1A6FA69Edd2F62fb35D;

    function setUp() public {
        //setting up contract for testing
        deploy = new DeployOracleRandNumber();
        oracle = deploy.run();
    }

    // function to pull random number but there's an error
    // I'm thinking testing dont work this way
    function testGetARandomNumber() public {
        vm.startPrank(consumer);
        uint256 requestId = oracle.requestRandomWords();
        oracle.getRequestStatus(requestId);
        vm.stopPrank();
    }
}
