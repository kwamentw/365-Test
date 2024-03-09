// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract FamilySubscription {
    //////////// event ////////////////
    event IsSubscriptionRenewed(bool);

    ///////// errors ///////////
    error Insufficient_Funds();
    error Invalid_Value();

    ///////// state variables ////////////
    uint256 public targetAmount = 5 ether;
    bool SubscriptionRenewed;
    bool ContributionReached;
    address SubscriptionManager;

    /**
     * to accept members contribution
     * its a family of 5
     * Every has to send equal contribution of 1 ether
     */
    function DepositSubscription() public payable {
        require(msg.value == 1 ether);
        uint256 balance = address(this).balance;
        if (balance == targetAmount) {
            ContributionReached = true;
        }
    }

    /**
     * To renew the subscription
     */
    function RenewSubscription() public returns (bool) {
        if (address(this).balance != 5 ether) {
            revert Insufficient_Funds();
        }
        require(ContributionReached);
        (bool sent, ) = SubscriptionManager.call{value: 5 ether}("");
        require(sent, "Txn failed");
        SubscriptionRenewed = true;
        return SubscriptionRenewed;
    }

    /**
     * To check the status of the susbscription
     */
    function checkSubscription() public {
        emit IsSubscriptionRenewed(SubscriptionRenewed);
    }
}
