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
    address owner;
    uint256 currentPrice;
    uint256 result;
    AggregatorV3Interface internal priceFeed;

    constructor(address _pricefeedaddress) {
        priceFeed = AggregatorV3Interface(_pricefeedaddress);
    }

    // receives usd to be converted
    receive() external payable {}

    /**
     * get version of current feed in use
     */
    function getVersion() external view returns (uint256) {
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
        result = _amount * (currentPrice);
        return result;
    }

    // function WithDrawETh(
    //     address payable receiver,
    //     uint256 _amount
    // ) external {
    //     result = ConvertETHToUSD(_amount);
    //     (bool ok, ) = receiver.call{value: result}("");
    //     require(ok, "Transaction was a failure");
    // }
}
