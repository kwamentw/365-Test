//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

//importing the script that will facilitate deploying
import {Script} from "forge-std/Script.sol";
//importing script to be deployed
import {Multiplication} from "../src/multiplication.sol";

/**
 * @title A loocal deploy script
 * @author Kwame 4b
 * @notice deploying to anvil
 */
contract MultiplicationDeploy is Script{
    function run() external returns(Multiplication) {
        //start deploy
        vm.startBroadcast();
        Multiplication multiply = new Multiplication();
        //end deploy
        vm.stopBroadcast();
        return multiply;
    }

}