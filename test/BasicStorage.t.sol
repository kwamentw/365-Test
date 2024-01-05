// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {BasicStorage} from "../src/BasicStorage.sol";
import {console} from "forge-std/console.sol";

contract BasicStorageTest is Test {
    BasicStorage public basicstorage;
    uint256 number = 4;

    function setUp() public {
        basicstorage = new BasicStorage();
    }

    function testStoreData() public {
        basicstorage.storeData(number);
    }

    function testRetrieve() public {
        basicstorage.retrieveData(number);
    }
}
