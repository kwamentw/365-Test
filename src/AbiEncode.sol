// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title AbiEncode Contract example
 * @author Kwame 4b
 * @notice A simple contract to test out AbiEncode & Decode
 */
contract AbiEncodeExample {
    /**
     * This emits the encoded data
     * @param dataHash keccak256 hash of encoded data
     * @param encodedData Encoded bytes
     */
    event DataEncoded(bytes32 indexed dataHash, bytes encodedData);

    /**
     * It encodes both the string and the uint
     * @param number the uint to encode
     * @param sample the string to encode
     */
    function encodeUintAndString(
        uint256 number,
        string memory sample
    ) external returns (bytes memory) {
        bytes memory encoded = abi.encode(number, sample);
        emit DataEncoded(keccak256(encoded), encoded);
        return encoded;
    }

    /**
     * It encodes multiple types of Data
     * @param number The number to be encoded
     * @param phrase the string to be encoded
     * @param affirm the bool to be encoded
     */
    function encodeMultipleTypes(
        uint256 number,
        string memory phrase,
        bool affirm
    ) external returns (bytes memory) {
        bytes memory encoded = abi.encode(number, phrase, affirm);
        emit DataEncoded(keccak256(encoded), encoded);
        return encoded;
    }

    /**
     * it decodes the encoded data and returns only uint
     * @param _encoded the data to decoded
     */
    function decodeAndReturnUint(
        bytes memory _encoded
    ) external pure returns (uint) {
        (uint256 decodedNumber, ) = abi.decode(_encoded, (uint256, string));
        return decodedNumber;
    }

    /**
     * This decodes the data and returns only string
     * @param _encoded The string to be decoded
     */
    function decodeAndReturnString(
        bytes memory _encoded
    ) external pure returns (string memory) {
        (, string memory decodedString) = abi.decode(
            _encoded,
            (uint256, string)
        );
        return decodedString;
    }

    /**
     * This decodes the data and returns multiple values
     * @param _encoded the data to be decoded
     * @return the decoded uint
     * @return the decoded string
     * @return the decoded bool
     */
    function decodeMultipleTypes(
        bytes memory _encoded
    ) external pure returns (uint256, string memory, bool) {
        (uint256 decodedNum, string memory decodedStr, bool decodedaffirm) = abi
            .decode(_encoded, (uint256, string, bool));
        return (decodedNum, decodedStr, decodedaffirm);
    }
}
