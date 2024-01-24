//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {TryEnum} from "../src/Enum.sol";
import {console2} from "forge-std/console2.sol";

contract EnumTest is Test {
    TryEnum enumobj;

    function setUp() public {
        enumobj = new TryEnum();
    }

    function testEnumAdd() public {
        assertEq(enumobj.AdditionBoys(3, 4), 3 + 4);
        enumobj.getEnum();
    }

    function testEnumSub() public {
        assertEq(enumobj.SubtractionBabies(5, 2), 2 - 5);
        enumobj.getEnum();
    }

    function testEnumMulti() public {
        assertEq(enumobj.MultiplicationNiggas(34, 43), 43 * 34);
        enumobj.getEnum();
    }

    function testEnumDivide() public {
        (enumobj.DivideBitches(43, 200), 200 / 43);
        enumobj.getEnum();
    }

    function testResetEnumToCustom() public {
        enumobj.ResetEnumToCustomParam(TryEnum.Operator.idunno);
        enumobj.getEnum();
    }

    function testEnumDel() public {
        enumobj.DelEnum();
        enumobj.getEnum();
    }
}
