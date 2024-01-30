//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title A simple try catch implementation
 * @author Kwame 4b
 * @notice Did it to understand how it works nothing major
 */
contract TryCatchEg {
    // events
    event ShowResult(uint256 result);
    event Log(string message);

    /**
     * This adds two numbers and returns their result
     * @param a first uint to add
     * @param b second uint to add
     */
    function Add(uint256 a, uint256 b) public pure returns (uint) {
        uint256 result = a + b;
        return result;
    }

    /**
     * This implements the trycatch concept
     * @param firstDigit first uint to add
     * @param secondDigit second uint to add to first
     */
    function LetsTryCatch(uint256 firstDigit, uint256 secondDigit) external {
        try this.Add(firstDigit, secondDigit) returns (uint256 result) {
            emit ShowResult(result);
            emit Log("Add successful");
        } catch Error(string memory errorMessage) {
            emit Log(errorMessage);
            // revert(errorMessage);
        } catch (bytes memory errorData) {
            emit Log(string(errorData));
            // revert(string(errorData));
        }
    }
}
