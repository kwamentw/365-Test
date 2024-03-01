//SPDX-License-Identifier:MIT

pragma solidity 0.8.20;

//import statements
import {RandomNumber} from "../src/RandomNumber.sol";
import {Test} from "forge-std/Test.sol";

contract TestRandomNumber is Test {
    //initializing contract
    RandomNumber rand;

    function setUp() public {
        //setting up contract
        rand = new RandomNumber();
    }

    /*
     *Testing if number is being generated
     */
    function testGenerateNum() public {
        rand.generateNumber();
    }
}
