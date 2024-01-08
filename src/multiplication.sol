// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Multiplication {
    uint256 public result;
    int256 public  results;
    
    // error to check overflows & underflows
    error ArithmeticOverUnderflow();

    /**
     * 
     * @param firstNum First Number of the multiplication
     * @param secondNum Second Number of the multiplication
     * multiply the two unsigned integers & returns the resulting value
     */
    function multiplyUint(uint256 firstNum, uint256 secondNum) external returns (uint256) {
            result = firstNum * secondNum;
            if (result > type(uint256).max || result < type(uint256).min) {
                revert ArithmeticOverUnderflow();
            }
            return result;
    }

    /**
     * 
     * @param firstNum First Number of the multiplication
     * @param secondNum Second Number of the multiplication
     * multiply the two signed numbers & returns the resulting value
     */

    function multiplyInt(int256 firstNum, int256 secondNum) external returns (int256) {
            results = firstNum * secondNum;
        
        if (results < type(int256).min || results > type(int256).max) {
            revert ArithmeticOverUnderflow();
        }

        return results;
    }
}
