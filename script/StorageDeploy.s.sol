//SPDX-License-identifier: MIT
pragma solidity 0.8.20;

// importing script to help deploy
import {Script} from "forge-std/Script.sol";
// importing the contract to deploy
import {BasicStorage} from "../src/BasicStorage.sol";
import {console} from "forge-std/console.sol";

/**
 * @title A Script that deploys BasicStorage.sol
 * @author Kwame 4b
 * @notice i will deploy like a pro
 */
contract StorageDeploy is Script {
    // local anvil chain deploy script
    // function run() external returns (BasicStorage) {
    //     // starts to deploy the contract specified
    //     vm.startBroadcast();
    //     BasicStorage store = new BasicStorage();
    //     // ends broadcast of what to deploy
    //     vm.stopBroadcast();
    //     return store;
    // }

    // this function deploys to sepolia testnet
    function run() public {
        //access private key
        uint privateKey = vm.envUint("PRIVATE_KEY");
        // create account with private key
        address account = vm.addr(privateKey);

        // print account address
        console.log("Account", account);

        // deploying
        vm.startBroadcast(privateKey);
        BasicStorage store = new BasicStorage();
        // call this function when deploying
        store.retrieveData(23);
        vm.stopBroadcast();
    }
}
