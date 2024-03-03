// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {VRFCoordinatorV2Interface} from "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import {VRFConsumerBaseV2} from "@chainlink/contracts/src/v0.8/vrf/VRFConsumerBaseV2.sol";

/**
 * @title Random number generator
 * @author Kwame 4B
 * @notice A contract to generate a random number using chainlink vrf
 */
contract OracleRandomNumber is VRFConsumerBaseV2 {
    event RequestSent(uint256 requestId, uint256 numWords);
    event RequestFulfilled(uint256 requestId, uint256[] RandomWords);

    struct RequestStatus {
        bool fulfilled; //whether the request has been successfully fulfilled
        bool exists; //whether a requestId exists
        uint256[] Randomwords;
    }

    mapping(uint256 => RequestStatus) public s_requests;
    VRFCoordinatorV2Interface COORDINATOR;

    //my subscription ID
    uint64 s_subscriptionId;

    //pasts requests ids
    uint256[] requestsIds;
    uint256 lastRequestId;

    // Gas lane == keyhash
    // they specify the max gas price
    bytes32 keyHash =
        0x474e34a077df58807dbe9c96d3c009b23b3c6d0cce433e59bbf5b34f823bc56c;

    // gas for a single word is about 20000
    uint32 callbackGasLimit = 100000;

    // default is 3
    uint16 requestConfirmations = 3;

    // this will retrieve 2 random values in one request
    uint32 numWords = 2;

    constructor(
        uint64 susbscriptionId
    ) VRFConsumerBaseV2(0x8103B0A8A00be2DDC778e6e7eaa21791Cd364625) {
        COORDINATOR = VRFCoordinatorV2Interface(
            0x8103B0A8A00be2DDC778e6e7eaa21791Cd364625
        );
        s_subscriptionId = susbscriptionId;
    }
}
