//SPDX-License-identifier: MIT
pragma solidity 0.8.20;

//import statements
import {Test} from "forge-std/Test.sol";
import {structExample} from "../src/Struct.sol";
import {console2} from "forge-std/console2.sol";

/**
 * @title A script to test Struct.sol
 * @author Kwame4B
 * @notice nothing to say really
 */
contract structTest is Test {
    structExample structss;

    function setUp() public {
        structss = new structExample();
    }

    function testAddEmployee() public {
        structss.AddEmployee("BigAvo", 122, 5, true);
        assertEq(structss.GetAllEmployees().length, 1);
    }

    function testGetEmployee() public {
        structss.AddEmployee("BigAvo", 122, 5, true);
        structss.GetEmployee(0);
    }

    function testGetSpecificDetails() public {
        structss.AddEmployee("BigAvo", 23, 6, false);
        structss.GetEmployeeAgeNameHeight(0);
    }

    function testRemoveEmployee() public {
        structss.AddEmployee("SmallAvo", 12, 4, true);
        structss.AddEmployee("BigAvo", 23, 6, false);
        uint256 lengthEmployees = structss.GetAllEmployees().length;
        structss.RemoveEmployee(0);
        assertGt(lengthEmployees, structss.GetAllEmployees().length);
    }

    function testUpdateEmpDetails() public {
        structss.AddEmployee("SmallAvo", 12, 4, true);
        structss.UpdateEmployeeDetails(0, 44, 7, false);
        structss.GetEmployee(0);
    }

    function testGetAllEmployees() public {
        structss.AddEmployee("SmallAvo", 12, 4, true);
        structss.AddEmployee("BigAvo", 23, 6, false);
        assertGt(structss.GetAllEmployees().length, 0);
        structss.GetAllEmployees();
    }
}
