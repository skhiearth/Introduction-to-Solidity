pragma solidity ^0.5.1;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    constructor(string memory _name) public {
        name = _name;
    }

    function mint() public {
        balances[tx.origin]++;
    }
}

contract MyToken is ERC20Token { // `is` keyword is used for inheritance
    string public symbol;
    address[] public owners;
    uint256 public ownerCount;

    // Constructor Overriding
    constructor(string memory _name, string memory _symbol) ERC20Token(_name) public /** Passes the argument from the
    constructor of `MyToken` to the constructor of `ERC20Token` */ {
        symbol = _symbol;
        name = _name;
    }

    // Function Overriding
    function mint() public {
        super.mint(); // Calls the `mint` function from the parent class so basic behaviour is preserved
        ownerCount++;
        owners.push(msg.sender);
    }
}
