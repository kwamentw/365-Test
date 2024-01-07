//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract BasicSubtraction {
    // This is a simple contract that executes a subtraction between two numbers

    // result holds the result for the final computation
    int256 public result;

    // This error indicates the resulting value will be bigger than max of int256
    error ArithmeticOverflow();
    // or smaller than the min if int256
    error ArithmeticUnderflow();

    /**
     *
     * @param a first digit to subtract
     * @param b second digit to subtract
     */
    function subDigits(int256 a, int256 b) public returns (int256) {
        // this is a check to make sure the variables do not go over their limits
        if (a < type(int256).min || b < type(int256).min) {
            revert ArithmeticUnderflow();
        }

        require((a < type(int256).max || b < type(int256).max), "input-oveflow");

        result = b - a;

        if (result < type(int256).min) {
            revert ArithmeticUnderflow();
        }
        require(result < type(int256).max, "overflow");

        return result;
    }
}
