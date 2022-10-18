// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract SimpleStorage {
    string private _message;
    address public owner;

    event MessageChanged(string newMessage);

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not an owner");
        _;
    }

    constructor() {
        _message = "This is a smart contract";
        owner = msg.sender;
    }

    function getMessage() public view returns (string memory) {
        return _message;
    }

    // Check-Effects-Interaction Pattern
    function setMessage(string memory message) public onlyOwner {
        require(bytes(message).length > 0, "Cannot be an empty string");
        _message = message;
        emit MessageChanged(message);
    }
}
