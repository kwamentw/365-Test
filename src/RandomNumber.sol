//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title A contract to generate random figures manually
 * @author Kwame 4B
 * @notice This contract is for test purposes
 */
contract RandomNumber {
    // event to log generated number
    event NumberGenerated(uint256);

    //function to generate random number
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
