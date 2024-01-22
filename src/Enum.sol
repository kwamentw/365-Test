// SPDX-License-Identifier:MIT
pragma solidity 0.8.20;

/**
 * @title An Enum contract
 * @author Kwame 4b
 * @notice Just a refresher because i want eat this thing for breakfast
 */
contract TryEnum {
    // declaring enums
    enum Operator {
        notchecked,
        addition,
        subtraction,
        multiplication,
        division
    }

    // making enum available for other functions access i.e initialization
    Operator public operationused;

    constructor() {
        //setting a default value
        operationused = Operator.notchecked;
    }

    /**
     * This function is used to add two numbers
     * @param a first digit you want to add
     * @param b second digit you want to add to the first
     * the enum detects the operator in use and updates the status
     */
    function AdditionBoys(uint256 a, uint40 b) public returns (uint256) {
        uint256 result = a + b;
        require(result == a + b, "addition was not possible");
        operationused = Operator.addition;
        return result;
    }

    /**
     * This function subtracts b from a
     * @param a the number you want subtract(Subtracteee)
     * @param b the number you wantt to subtract from
     * the enum detects the operator in use and updates the status
     */
    function SubtractionBabies(int256 a, int256 b) public returns (int256) {
        int256 result = b - a;
        require(result == b - a, "This is not subtraction");
        operationused = Operator.subtraction;
        return result;
    }

    /**
     * This is meant to multiply two numbers
     * @param a first value of multiplication
     * @param b second value of multiplication
     * the enum detects the operator in use and updates the status
     */
    function MultiplicationNiggas(int256 a, int256 b) public returns (int256) {
        int256 result = b * a;
        require(result == b * a, "This no be multiplication");
        operationused = Operator.multiplication;
        return result;
    }

    /**
     * This function is used to get the current status of the Operator
     */
    function getEnum() public view returns (Operator) {
        return operationused;
    }

    /**
     * In this function a divides b
     * @param a the divider value
     * @param b the value to be divided
     * the enum detects the operator in use and updates the status
     */
    function DivideBitches(uint256 a, uint256 b) public returns (uint256) {
        uint256 result = b / a;
        require(result == b / a, "This operation did not divide");
        operationused = Operator.division;
        return result;
    }

    /**
     * A function to force reset the enum
     * @param resetval type "notchecked" as the status for this param to reset
     */
    function ResetEnumToCustomParam(Operator resetval) public {
        operationused = resetval;
    }

    /**
     * This function resets the status of the enum to the first member
     */
    function DelEnum() public {
        delete operationused;
    }
}
