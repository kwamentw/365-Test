//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract TryCatchEg {
    event ShowResult(uint256 result);

    function Add(uint256 a, uint256 b) public pure returns (uint) {
        uint256 result = a + b;
        return result;
    }

    function LetsTryCatch() external {
        try this.Add(345, 3319) returns (uint256 result) {
            emit ShowResult(result);
        } catch Error(string memory errorMessage) {
            revert(errorMessage);
        } catch (bytes memory errorData) {
            revert(string(errorData));
        }
    }
}
