// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title A timelock contract to demonstrate arithmetic overflow & underflow
 * @author Kwame4B
 * @notice This is just for learning purposes
 */
contract TimeLock {
    mapping(address => uint256) balances;
    mapping(address => uint256) locktime;

    error Insufficient_balance();
    error WaitTimeNotSatisfied();

    function Deposit() external payable {
        balances[msg.sender] += msg.value;
        locktime[msg.sender] = block.timestamp + 1 weeks;
    }

    function IncreaseLockTIme(uint256 _secondsToIncrease) public {
        locktime[msg.sender] += _secondsToIncrease;
    }

    function withdraw() public {
        if (balances[msg.sender] < 0) {
            revert Insufficient_balance();
        }
        if (block.timestamp < locktime[msg.sender]) {
            revert WaitTimeNotSatisfied();
        }

        uint256 amount = balances[msg.sender];
        balances[msg.sender] = 0;

        (bool sent, ) = (msg.sender).call{value: amount}("");
        require(sent, "Transaction failed");
    }
}
