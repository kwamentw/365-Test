// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title A fallback test
 * @author kwame 4B
 * @notice just wondering how different it is from receve
 */
contract FallbacTry {
    // events
    // event status(string);
    event Details(address, uint256);

    /**
     * A function that gets called when theres no match in func signature
     */
    fallback() external payable {
        // emiting
        // emit status("No match, i guess i will emit");
        emit Details(address(this), msg.value);
    }
}
