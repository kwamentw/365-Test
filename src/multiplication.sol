// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Multiplication {
    uint256 public result;
    int256 public  results;

    error UintOverflow();
    error ArithmeticOverUnderflow();

    function multiplyUint(uint256 firstNum, uint256 secondNum) external returns (uint256) {
        if (firstNum > type(uint256).max || secondNum > type(uint256).max) {
            revert UintOverflow();
        } else {
            // multiply the two unsigned integers
            result = firstNum * secondNum;
            if (result > type(uint256).max || result < type(uint256).min) {
                revert ArithmeticOverUnderflow();
            }
            return result;
        }
    }

    function multiplyInt(int256 firstNum, int256 secondNum) external returns (int256) {
        if (firstNum < type(int256).min || secondNum < type(int256).min) {
            revert ArithmeticOverUnderflow();
        } else {
            // multiply the two signed numbers
            results = firstNum * secondNum;
        }
        if (results < type(int256).min || results > type(int256).max) {
            revert ArithmeticOverUnderflow();
        }

        return results;
    }
}
