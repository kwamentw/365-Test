//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract BasicAddition{
    // This is a simple contract that adds 3 digits
    uint256 public result;
    error OverUintLimit();

    function addDigits(uint256 a, uint256 b, uint256 c) public returns (uint256){
        // this is a check to make sure the variables do not go over their limits
        if (a> type(uint256).max && b> type(uint256).max && c> type(uint256).max ){
            revert OverUintLimit();
        }
        result = a + b + c;
        return result;
    }

}