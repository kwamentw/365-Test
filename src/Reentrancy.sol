// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract ReenterProne {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 bal = balances[msg.sender];
        require(bal > 0, "Insufficient funds");

        (bool success, ) = (msg.sender).call{value: 1 ether}("");
        require(success);

        balances[msg.sender] -= 1 ether;
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
