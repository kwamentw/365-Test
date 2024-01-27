//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract TryCatchEg {
    event ShowResult(uint256 result);
    event Log(string message);

    function Add(uint256 a, uint256 b) public pure returns (uint) {
        uint256 result = a + b;
        return result;
    }

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
