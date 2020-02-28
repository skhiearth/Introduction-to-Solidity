// Declaring the version of Solidity we are using
pragma solidity ^0.4.24;

/** Declaring a smart contract - Code that gets executed on the blockchain. Smart contract is like a micro-service out on
 * the web accessible to everyone on the blockchain, they'll be able to see it, use it, read and write data with it and
 * actually execute any code we write inside of it. Unlike a regular class, it is publicly accessible on the blockchain.
 * A smart contract looks like a class, because we keep all out code inside of it.
**/

contract MyContract {
    // Variables
    string value;
    /** This variable is stored on the blockchain, and unlike a local variable, any changes to this variable
     * are reflected on the blockchain.
    **/

    // Constructor - code get's called whenever contract is created
    constructor() public {
        value = "DEFAULT";
    }

    // Functions
    function get() public view returns(string){
        return value;
    }

    // A public function can be called by all who have access to the contract on the blockchain.

    function set(string _value) public {
        value = _value;
    }
}
