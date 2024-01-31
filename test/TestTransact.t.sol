// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

//import Statements
import {Test} from "forge-std/Test.sol";
import {Transact} from "../src/Transact.sol";
import {console2} from "forge-std/console2.sol";

/**
 * This is a script to test the transact contract
 * @notice this is just hands on
 */

contract TestTransact is Test {
    Transact senrec;

    function setUp() public {
        senrec = new Transact();
    }

    receive() external payable {}

    function testLogBalance() public view {
        console2.log("Your balance is: ", address(this).balance / 1e18);
        console2.log("Your contract balance is: ", senrec.getBalance() / 1e18);
    }

    function testNotOwnerSendEth() public {
        hoax(payable(address(5)), 123);
        vm.expectRevert(bytes("you are not the owner"));
        senrec.SendEth(payable(address(6)), 123);
    }

    function testOwnerSendEth() public {
        depositToContract(3);
        uint256 balbefore = address(this).balance;
        senrec.SendEth(payable(address(this)), 2);
        assertLt(balbefore, address(this).balance);
    }

    function testNotOwnerWithdrawEth() public {
        depositToContract(22);
        vm.expectRevert();
        hoax(address(33), 2234);
        senrec.withdraw(1);
    }

    function depositToContract(uint256 amount) public {
        (bool ok, ) = address(senrec).call{value: amount}("");
        require(ok, "Txn failed!");
    }
}
