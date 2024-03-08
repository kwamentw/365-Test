//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {ReentrancyAttack} from "../src/ReentrancyAttack.sol";
import {ReenterProne} from "../src/ReentrancyProne.sol";
import {console2} from "forge-std/console2.sol";

/**
 * @title trying to carry out a reenterancy attack
 * @author Kwame4b
 * @notice just seeking clarification
 */
contract ReenterAttackTest is Test {
    /**
     * Try it in remix
     * just deploy the two contracts
     * i.e the Reentrancy prone contract [ReentrancyProne.sol] and the attacker contract i.e ReentrancyAttack.sol
     * Send 1 ether whilst calling the attack function in the attack contract
     * You see reentrancy play  out
     *
     * Was trying to let this work locally but i couldn't
     *
     * just realised if i wanted to attack locally there was no need for the attack contract
     * i could have just written a test contract to expolit it
     */
}
