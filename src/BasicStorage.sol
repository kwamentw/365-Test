// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BasicStorage {
    // This is a simple program that stores your favorite number as a secret
    uint256 public data;

    function storeData(uint256 _data) public {
        data = _data;
        bytes32 hashEncodedNumber1 = keccak256(abi.encode(_data));
    }

    function retrieveData(uint256 _data) public returns (bytes32) {
        data = _data;
        bytes32 hashEncodedNumber = keccak256(abi.encode(_data));
        return hashEncodedNumber;
    }
}
