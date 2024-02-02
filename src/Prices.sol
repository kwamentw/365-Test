//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceEth {
    AggregatorV3Interface internal pricefeed;

    constructor() {
        pricefeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
    }

    function getETHUSDCurrentPrice() public view returns (int256) {
        (, int256 answer, , , ) = pricefeed.latestRoundData();
        return answer;
    }
}
