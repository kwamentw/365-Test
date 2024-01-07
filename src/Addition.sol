//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract BasicAddition {
    // This is a simple contract that adds 3 digits

    // result holds the result for the final computtation
    uint256 public result;

    // This error indicates the result value is bigger than max of uint256
    error ArithmeticOverflow();

    /**
     *
     * @param a first digit to add
     * @param b second digit to add
     * @param c third number to add
     */
    function addDigits(uint256 a, uint256 b, uint256 c) public returns (uint256) {
        // this is a check to make sure the variables do not go over their limits
        if (a > type(uint256).max || b > type(uint256).max || c > type(uint256).max) {
            revert ArithmeticOverflow();
        }
        require((a > type(uint256).min && b > type(uint256).min && c > type(uint256).min), "Underflow");
        result = a + b + c;
        return result;
    }
}
