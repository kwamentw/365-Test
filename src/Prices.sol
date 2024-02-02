//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// importing interface
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

/**
 * @title A contract to check for price of ETH in USD in real time
 * @author Kwame 4b
 * @notice Trying to see if i can
 */
contract PriceEth {
    // initialising the interface
    AggregatorV3Interface internal pricefeed;

    /**
     * Initializes pricefeed address
     * @param _pricefeed ETH/USD pricefeed
     */
    constructor(address _pricefeed) {
        // 0x694AA1769357215DE4FAC081bf1f309aDC325306
        pricefeed = AggregatorV3Interface(_pricefeed);
    }

    /**
     * Returns the price of ETH in USD
     */
    function getETHUSDCurrentPrice() public view returns (int256) {
        (, int256 answer, , , ) = pricefeed.latestRoundData();
        return answer;
    }

    /**
     * Retuns the version of the oracle in use.
     */
    function getVersion() public view returns (uint) {
        return pricefeed.version();
    }
}
