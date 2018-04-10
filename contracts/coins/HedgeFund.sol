pragma solidity ^0.4.18;


contract HedgeFund {
    address public owner;
    uint public balance;
    uint public depositLimit;
    event Deposit(address who, uint value);
    event FundBalanceUpdate(uint oldValue, uint newValue);
    event DepositLimitUpdate(uint old, uint newVal);

    modifier only_owner {
        require(msg.sender == owner);
        _;
    }

    modifier ether_required {
        require(msg.value > 0 wei);
        _;
    }

    function HedgeFund() public payable ether_required {
        owner = msg.sender;
        depositLimit = 200;
        balance = msg.value;
    }

    function updateDepositLimit(uint value) public only_owner {
        require(value >= 200);
        DepositLimitUpdate(depositLimit, value);
        depositLimit = value;
    }

    function deposit() public only_owner ether_required payable {
        require(msg.value > depositLimit);

        balance += msg.value;
        Deposit(msg.sender, msg.value);
    }

    function balance() public constant returns (uint) {
        return balance;
    }

    function owner() public constant returns (address) {
        return owner;
    }
}

