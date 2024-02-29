//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title A contract to generate posittive random figures manually
 * @author Kwame 4B
 * @notice This contract is for test purposes
 */
contract RandomNumber {
    // emits when number generated
    event NumberGenerated(uint256);

    /**
     * Function to generate random number
     * Random number is an unsigned integer
     */
    function generateNumber() public returns (uint256) {
        uint256 RandNum = uint256(
            keccak256(
                abi.encodePacked(block.timestamp, block.prevrandao, msg.sender)
            )
        );
        emit NumberGenerated(RandNum);
        return RandNum;
    }
}
