//SPDX-License-identifier:MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {AbiEncodeExample} from "../src/AbiEncode.sol";

contract EncodeTest is Test {
    AbiEncodeExample abienc;
    event DataEncoded(bytes32 indexed dataHash, bytes encodedData);

    function setUp() external {
        abienc = new AbiEncodeExample();
    }

    function testEncUintStr() public {
        abienc.encodeUintAndString(23, "yo-nyG");
    }

    function testEncMultiTypes() public {
        abienc.encodeMultipleTypes(23, "ert-fgg", true);
    }

    function testDecodeUint() public {
        bytes memory encodedData = abienc.encodeUintAndString(23, "yo-nyG");
        abienc.decodeAndReturnString(encodedData);
    }

    function testDecodeStr() public {
        bytes memory encodedData = abienc.encodeUintAndString(23, "yo-nyG");
        abienc.decodeAndReturnString(encodedData);
    }

    function testMultipleDecode() public {
        bytes memory encodedData = abienc.encodeMultipleTypes(
            23,
            "ert-fgg",
            true
        );
        abienc.decodeMultipleTypes(encodedData);
    }
}
