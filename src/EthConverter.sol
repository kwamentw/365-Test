// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.4/interfaces/AggregatorV3Interface.sol";

contract EthConverter {
    address owner;
    uint256 currentPrice;
    uint256 result;
    AggregatorV3Interface internal priceFeed;

    constructor(address _pricefeedaddress) {
        priceFeed = AggregatorV3Interface(_pricefeedaddress);
    }

    receive() external payable {}

    function getVersion() external view returns (uint256) {
        return priceFeed.version();
    }

    function getCurrentPrice() public view returns (uint256) {
        (, int256 currPrice, , , ) = priceFeed.latestRoundData();
        return uint256(currPrice);
    }

    function ConvertETHToUSD(uint256 _amount) public returns (uint256) {
        currentPrice = getCurrentPrice();
        result = _amount * (currentPrice);
        return result;
    }

    function WithDrawUSDEquivalent(
        address payable receiver,
        uint256 _amount
    ) external {
        result = ConvertETHToUSD(_amount);
        (bool ok, ) = receiver.call{value: result}("");
        require(ok, "Transaction was a failure");
    }
}
