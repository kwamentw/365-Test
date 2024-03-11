// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title A contract to demonstrate delegatecall
 * @author Kwame4B
 * @notice just for education purposes
 */
contract FirstContract {
    // storage layout must be the same if it gon work
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(uint256 _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract SecondContract {
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(address _contract, uint256 _num) public payable {
        // A's storage is set, B's storage is not modified
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSelector(FirstContract.setVars.selector, _num)
        );
        require(success);
    }
}
