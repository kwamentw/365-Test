//SPDX-License-identifier:MIT
pragma solidity 0.8.20;

// import statements
import {Test} from "forge-std/Test.sol";
import {AbiEncodeExample} from "../src/AbiEncode.sol";

contract EncodeTest is Test {
    //initializing contract
    AbiEncodeExample abienc;
    //events to emit
    event DataEncoded(bytes32 indexed dataHash, bytes encodedData);

    /**
     * setting up contract for test
     */
    function setUp() external {
        abienc = new AbiEncodeExample();
    }

    /**
     * testing whether the encode uint & string works normally
     */
    function testEncUintStr() public {
        abienc.encodeUintAndString(23, "yo-nyG");
    }

    /**
     * testing whether the encode multi data types works normally
     */
    function testEncMultiTypes() public {
        abienc.encodeMultipleTypes(23, "ert-fgg", true);
    }

    /**
     * Testing whether Decode uint works
     */
    function testDecodeUint() public {
        bytes memory encodedData = abienc.encodeUintAndString(23, "yo-nyG");
        abienc.decodeAndReturnString(encodedData);
    }

    /**
     * Testing whether Decode string works
     */
    function testDecodeStr() public {
        bytes memory encodedData = abienc.encodeUintAndString(23, "yo-nyG");
        abienc.decodeAndReturnString(encodedData);
    }

    /**
     * Testing whether Multiple Decode works
     */
    function testMultipleDecode() public {
        bytes memory encodedData = abienc.encodeMultipleTypes(
            23,
            "ert-fgg",
            true
        );
        abienc.decodeMultipleTypes(encodedData);
    }
}
