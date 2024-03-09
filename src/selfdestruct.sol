// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract FamilySubscription {
    event IsSubscriptionRenewed(bool);
    error Insufficient_Funds();
    error Invalid_Value();

    uint256 public targetAmount = 5 ether;
    bool SubscriptionRenewed;
    address SubscriptionManager;

    /**
     * its a family of 5
     * Every has to send equal contribution of 1 ether
     */
    function DepositSubscription() public payable {
        if (msg.value == 1 ether) {
            uint256 balance = address(this).balance;
            if (balance < 5 ether) {
                revert Insufficient_Funds();
            }
            (bool sent, ) = SubscriptionManager.call{value: 5 ether}("");
            require(sent, "Txn failed");
            SubscriptionRenewed = true;
        } else {
            revert Invalid_Value();
        }
    }

    function checkSubscription() public {
        emit IsSubscriptionRenewed(SubscriptionRenewed);
    }
}
