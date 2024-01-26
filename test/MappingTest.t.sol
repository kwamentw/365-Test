//SPDX-License-identifier: MIT
pragma solidity 0.8.20;

// import statements
import {Test} from "forge-std/Test.sol";
import {MappingConEx} from "../src/Mappings.sol";

/**
 * @title A test suite for a custom mapping contract
 * @author Kwme 4b
 * @notice Nothing major just getting comfortable with basic stuff
 */
contract TestMappings is Test {
    // initializing mapping contract for test
    MappingConEx map;

    //setting up tests
    function setUp() public {
        map = new MappingConEx();
    }

    /**
     * a test to check whether saving your money really works
     */
    function testSaveMoneyInYourBox() public {
        map.SaveMoneyInYourBox(0, msg.sender, 233);
    }

    /**
     * A test to check the amount you have saved in you box is updated
     */
    function testCheckAmount() public {
        map.SaveMoneyInYourBox(1, address(22), 445);
        assertEq(map.CheckAmount(1), 445);
    }

    /**
     * The same as the previous test but this is for the more detailed Box
     */
    function testCheckAmountBox1() public {
        map.SaveMoneyInYourBox(1, address(3445), 345);
        uint256 amountBox1 = map.CheckAmountBox1(1).amount;
        assertEq(amountBox1, 345);
    }

    /**
     * A test to check whether address of the executor is the same as expected
     */
    function testCheckAddressBox1() public {
        map.SaveMoneyInYourBox(1, address(3445), 345);
        address Box1id = map.CheckAmountBox1(1).owner;
        assertEq(address(3445), Box1id);
    }

    /**
     * A test to check whether you can clear out your susu
     */
    function testClearSavings() public {
        map.SaveMoneyInYourBox(1, address(3445), 345);
        map.SaveMoneyInYourBox(0, msg.sender, 233);

        map.ClearSavings(1);
        map.CheckAmount(1);
        map.CheckAmountBox1(1);
    }
}
