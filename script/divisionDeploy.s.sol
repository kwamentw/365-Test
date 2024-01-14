//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

//imprting neccessary dependencies
import {Script} from "forge-std/Script.sol";
import {Division} from "../src/Division.sol";

/**
 * @title A division deloying script
 * @author Kwame 4B
 * @notice this is to deploy to the local anvil chain
 */
contract divisionDeploy is Script{
    //function to deploy contract
    function run() external returns(Division){
        vm.startBroadcast();
        Division divide = new Division();
        vm.stopBroadcast();
        return divide;
    }
}