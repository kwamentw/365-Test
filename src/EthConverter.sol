// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

//import statements
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.4/interfaces/AggregatorV3Interface.sol";

/**
 * @title A contract to convert eth to usd
 * @author Kwame 4b
 * @notice trial contract
 */
contract EthConverter {
    uint256 private constant PRECISION = 1e18;

    address owner;
    uint256 currentPrice;
    uint256 result;
    AggregatorV3Interface internal priceFeed;

    constructor(address _pricefeedaddress) {
        priceFeed = AggregatorV3Interface(_pricefeedaddress);
    }

    /**
     * get version of current feed in use
     */
    function getVersionn() external view returns (uint256) {
        return priceFeed.version();
    }

    /**
     * Gets current price of ether in usd
     */
    function getCurrentPrice() public view returns (uint256) {
        (, int256 currPrice, , , ) = priceFeed.latestRoundData();
        return uint256(currPrice);
    }

    /**
     * converts eth to usd
     * @param _amount amount to convert
     */
    function ConvertETHToUSD(uint256 _amount) public returns (uint256) {
        currentPrice = getCurrentPrice();
        // there are extra two decimal places for coins or cents thats why usd returns 6 decimal places the real deal is 4 + 2decimals for coins
        // i beleive you should divide by 8 to get actual value without the cents accountablity
        // result returns 13 decimal places 6 for usd(as explained) rest are precision places
        result = (_amount * (currentPrice * PRECISION)) / PRECISION;
        return result;
    }

    /**
     * A trivial function to convert usd into eth
     * @param amountInUSD amount of USD to be converted to ETH
     * Just playing around with these decimals
     */
    function ConvertUSDToEth(
        uint256 amountInUSD
    ) public view returns (uint256) {
        uint256 currentUSDValue = getCurrentPrice();
        require(
            (amountInUSD * 1e8) > currentUSDValue,
            "We can't do computations below the specified limits"
        );
        return ((amountInUSD) / (currentUSDValue / 1e8));
    }
}
