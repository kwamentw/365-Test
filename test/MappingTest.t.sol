//SPDX-License-identifier: MIT
pragma solidity 0.8.20;

// import statements
import {Test} from "forge-std/Test.sol";
import {MappingConEx} from "../src/Mappings.sol";

/**
 * @title A test suite for a custom mapping contract
 * @author
 * @notice
 */
contract TestMappings is Test {
    // initializing mapping contract for test
    MappingConEx map;

    //setting up tests
    function setUp() public {
        map = new MappingConEx();
    }

    function testSaveMoneyInYourBox() public {
        map.SaveMoneyInYourBox(0, msg.sender, 233);
    }

    function testCheckAmount() public {
        map.SaveMoneyInYourBox(1, address(22), 445);
        assertEq(map.CheckAmount(1), 445);
    }

    function testCheckAmountBox1() public {
        map.SaveMoneyInYourBox(1, address(3445), 345);
        uint256 amountBox1 = map.CheckAmountBox1(1).amount;
        assertEq(amountBox1, 345);
    }

    function testCheckAddressBox1() public {
        map.SaveMoneyInYourBox(1, address(3445), 345);
        address Box1id = map.CheckAmountBox1(1).owner;
        assertEq(address(3445), Box1id);
    }

    function testClearSavings() public {
        map.SaveMoneyInYourBox(1, address(3445), 345);
        map.SaveMoneyInYourBox(0, msg.sender, 233);

        map.ClearSavings(1);
        map.CheckAmount(1);
        map.CheckAmountBox1(1);
    }
}
