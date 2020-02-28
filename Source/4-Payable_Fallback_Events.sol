pragma solidity ^0.5.1;

contract MyContract {
    mapping(address => uint256) public balances;
    address payable wallet; // Implicitly declaring that this address can accept Ether

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    // Function that accepts ether - Buy Token and send Ether to the wallet
    function buyToken() public payable { // Payable modifier allows function to accept Ether
        balances[msg.sender]+=1; // Buy one token on function call
        wallet.transfer(msg.value); // `msg.value` returns how much Ether is sent in by the user who calls the function
        emit Purchase(msg.sender, 1); // Calling an event
    }

    // Fallback Function - Default Function that we can wrap other things in
    function() external payable { // External can only be called from outside of the contract
        buyToken();
    }

    // Events - Used to allow External consumers to listen for actions on a Smart Contract
    event Purchase(
        address indexed _buyer; // `indexed` keyword allows us to filter on based on specific values
        uint256 amount;
    );
}
