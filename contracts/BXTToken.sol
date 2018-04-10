pragma solidity ^0.4.4;


contract BXTToken {
    uint public value;
    address public owner;

    function BXTToken() {
        value = 200;
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender != owner);
        _;
    }

    function deposit(uint val) onlyOwner {
        value = val;
    }
}
