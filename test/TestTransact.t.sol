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
    // initialising contract
    Transact senrec;

    function setUp() public {
        senrec = new Transact();
    }

    /**
     * facilitate receiving of funds
     */
    receive() external payable {}

    /**
     * This logs the current balance of the two contracts involved
     */
    function testLogBalance() public view {
        console2.log("Your balance is: ", address(this).balance / 1e18);
        console2.log("Your contract balance is: ", senrec.getBalance() / 1e18);
    }

    /**
     * This test whether non owners can send eth | this is expected to reverted
     */
    function testNotOwnerSendEth() public {
        hoax(payable(address(5)), 123);
        vm.expectRevert(bytes("you are not the owner"));
        senrec.SendEth(payable(address(6)), 123);
    }

    /**
     * Tests whether owner can send eth successfully
     */
    function testOwnerSendEth() public {
        depositToContract(3);
        uint256 balbefore = address(this).balance;
        senrec.SendEth(payable(address(this)), 2);
        assertLt(balbefore, address(this).balance);
    }

    /**
     * A test to check whether there's a revert on insufficient balance
     */
    function testfailSendEth() public {
        depositToContract(22);
        vm.expectRevert();
        senrec.SendEth(payable(address(454)), 34);
        console2.log(address(454).balance);
    }

    /**
     * Tests whether non owners can withdraw eth
     */
    function testNotOwnerWithdrawEth() public {
        depositToContract(22);
        vm.expectRevert();
        hoax(address(33), 2234);
        senrec.withdraw(1);
    }

    /**
     * Test the validation of the owner calling withdraw
     */
    function testOwnerWithdrawEth() public {
        depositToContract(23);
        uint256 balbefore = senrec.getBalance();
        uint256 thisbalbefore = address(this).balance;
        senrec.withdraw(12);
        assertGt(balbefore, senrec.getBalance());
        assertEq(thisbalbefore, address(this).balance - 12);
    }

    /**
     * A test to check whether there's a revert on insufficient balance
     */
    function testfailWithdraw() public {
        depositToContract(2);
        vm.expectRevert();
        senrec.withdraw(45);
        console2.log(address(this).balance);
        console2.log(senrec.getBalance());
    }

    /**
     * Trying to see whether the contract can send money it itself using its own function
     * turns out it was possible
     */
    function testfingAround() public {
        depositToContract(25);
        senrec.SendEth(payable(address(senrec)), 23);
    }

    /**
     * To deposit funds into the contract
     * @param amount the amount of ETH you want to deposit
     */
    function depositToContract(uint256 amount) public {
        hoax(address(1223), 22245);
        (bool ok, ) = address(senrec).call{value: amount}("");
        require(ok, "Txn failed!");
    }

    /**
     * testing deposit functions
     */
    // function testDeposit() public {
    //     depositToContract(233);
    //     assertEq(senrec.getBalance(), 233);
    // }

    // function testfailDeposit() public {
    //     vm.expectRevert();
    //     depositToContract(993333333333);
    // }
}
