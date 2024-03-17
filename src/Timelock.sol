// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title A timelock contract to demonstrate arithmetic overflow & underflow
 * @author Solidity by example
 * @notice This is just for learning purposes
 */
contract TimeLock {
    /////////////// MAPPINGS ////////////////////
    mapping(address => uint256) public balances;
    mapping(address => uint256) public locktime;

    /////// ERRORS //////////////
    error Insufficient_balance();
    error WaitTimeNotSatisfied();

    /**
     * To deposit ether
     */
    function Deposit() external payable {
        balances[msg.sender] += msg.value;
        locktime[msg.sender] = block.timestamp + 1 weeks;
    }

    /**
     * to increase lock time
     * @param _secondsToIncrease seconds to increase by
     */
    function IncreaseLockTIme(uint256 _secondsToIncrease) public {
        locktime[msg.sender] += _secondsToIncrease;
    }

    /**
     * To withdraw Ether with some constraints
     */
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
