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
    event RequestSent(uint256 requestId, uint256 numWords); // emits when request is sent
    event RequestFulfilled(uint256 requestId, uint256[] RandomWords); // emits when requests is fulfilled

    struct RequestStatus {
        bool fulfilled; //whether the request has been successfully fulfilled
        bool exists; //whether a requestId exists
        uint256[] RandomWords; // random values depending on how many is specified in `numWords`
    }

    // mapping to store requests status
    mapping(uint256 => RequestStatus) public s_requests;
    // coordinator contract
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

    //Assumes subscription is funded sufficiently
    /**
     * Submits your request to vrf coordinator contract with specified parameters
     */
    function requestRandomWords() external returns (uint256 requestId) {
        // will revert if subscription is not set and funded
        requestId = COORDINATOR.requestRandomWords(
            keyHash,
            s_subscriptionId,
            requestConfirmations,
            callbackGasLimit,
            numWords
        );
        s_requests[requestId] = RequestStatus({
            RandomWords: new uint256[](0),
            exists: true,
            fulfilled: false
        });
        requestsIds.push(requestId);
        lastRequestId = requestId;
        emit RequestSent(requestId, numWords);
        return requestId;
    }

    /**
     * Retrieves and stores random values
     * @param _requestId Id of the request
     * @param _randomwords random numbers array
     */
    function fulfillRandomWords(
        uint256 _requestId,
        uint256[] memory _randomwords
    ) internal override {
        require(s_requests[_requestId].exists, "Request does not exist");
        s_requests[_requestId].fulfilled = true;
        s_requests[_requestId].RandomWords = _randomwords;
        emit RequestFulfilled(_requestId, _randomwords);
    }

    /**
     * A function to get random numbers
     * @param _requestId id of the request
     * @return fulfilled bollean to evaluate fulfillment
     * @return randomwords returns random numbers
     */
    function getRequestStatus(
        uint256 _requestId
    ) external view returns (bool fulfilled, uint256[] memory randomwords) {
        require(s_requests[_requestId].exists, "Request does not exist");
        RequestStatus memory request = s_requests[_requestId];
        return (request.fulfilled, request.RandomWords);
    }
}
