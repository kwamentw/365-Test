// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Division{
    // results from the intDivision
    int256 public signedResults;
    // results from the uintDivision
    uint256 public unsignedResults;

    // This is an Error that is thrown when a computation returns 0 instead of a float var(we all know solidity)
    error FloatVarErr();

    /**
     * 
     * @param a first unsigned integer
     * @param b second unsigned integer
     * This function divides two unsigned integers
     */
    function UintDivision(uint256 a, uint256 b)external  returns (uint256){
        require(a< type(uint256).max && b < type(uint256).max,"Max-input-Err");
        require(a>0 && b>0,"Cannot-divide-by-zero");
        require(a>=b, "Results-is-floatValue-not-zero");

        //Division
        unsignedResults = a / b;
        return unsignedResults;
    }
    /**
     * 
     * @param a first integer
     * @param b second integer 
     * This function divides two integers
     */

    function intDivision(int256 a, int256 b) external returns(int256){
        require(a>type(int256).min && b>type(int256).min,"Underflow");
        require(a!= 0 && b!=0,"Cannot-divide-by-zero");

        // Division 
        signedResults = a / b;
        // checking whether computation results in a zero since there's no float var in solidity
        if (signedResults ==0){
            revert FloatVarErr();
        }
        return signedResults;

    }
}