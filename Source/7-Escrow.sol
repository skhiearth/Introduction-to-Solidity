pragma solidity ^0.5.1;

/** An escrow contract is basically something that solves the problem of trust in a financial transaction by introducing a
 * third-party that facilitates the transaction. It acts like a middle-man. The third-party gets the assets and officiates
 * if each person in the transaction upholds their end of the bargain, and then facilitates the transaction.
*/

contract Escrow {

    /** An escrow agent  - a person who officiates the transaction of the blockchain, basically an ethereum agent's address
     * who is allowed to deposit funds and withdraw them in the smart contract. Makes sure that the transaction was successful
     * and then makes sure the person who was supposed to be paid is actually paid. An escrow agent is the only person allowed
     * to use the Escrow smart contract and call its functions.
    */
    address agent; // Escrow Agent
    mapping(address => uint256) public deposits; // Store all deposits in Escrow

    // We only want the escrow agent to call these functions
    modifier onlyAgent() {
        require(msg.sender == agent);
        _;
    }

    constructor() public {
        agent = msg.sender; // The one who deploys the smart contract is set as the Escrow Agent
    }

    // The `payee` is the person who is getting paid. This function is used to deposit funds to their account.
    function deposit(address payee) payable public onlyAgent {
        uint256 amount = msg.value; // Keep track of value deposited
        deposits[payee] = deposits[payee] + amount; // Keep track of funds sent it
    }

    function withdraw(address payable payee) public onlyAgent {
        uint256 payment = deposits[payee]; // Read the amount that was deposited previously
        deposits[payee] = 0; // Clear out
        payee.transfer(payment); // Actually send the amount to payee
    }

}
