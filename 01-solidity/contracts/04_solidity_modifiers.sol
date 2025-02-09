// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "hardhat/console.sol";

contract SolidityModifiers {
    address admin;
    uint256 balance = 0;

    constructor(uint256 initialBalance, address allowedAddress) {
        balance = initialBalance;
        admin = allowedAddress;
    }

    modifier isAdmin() {
        require(msg.sender == admin, "You are not allowed!");
        _;
    }

    function addBalance(uint256 toAddBalance) public isAdmin {
        balance += toAddBalance;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }
}