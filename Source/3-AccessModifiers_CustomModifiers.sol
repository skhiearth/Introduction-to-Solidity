pragma solidity ^0.5.1;

contract MyContract {
    address owner;
    uint256 public peopleCount = 0;
    uint256 public openingTime = 1582916143;
    mapping(uint256 => Person) public peopleMapping;

    struct Person {
        uint id;
        string _firstName;
        string _lastName;
    }

    constructor() public {
        owner = msg.sender;
    }

    // A `public` function can be called on the public interface of the smart contract.
    function addPerson(string memory _firstName, string memory _lastName) public {
        peopleCount+=1;
        peopleMapping[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    // An `internal` is not exposed to things outside the contract and external callers can't use it.
    function incrementCount() internal {
        peopleCount+=1;
    }

    // A function with a custom modifier which allows only the owner to call it
    modifier onlyOwner() {
        require(msg.sender == owner); // Require works like error handling
        _;
        // `msg.sender` gets us the address of the one who calls a function
    }

    function addPer(string memory _firstName, string memory _lastName) public onlyOwner {
        peopleCount+=1;
        peopleMapping[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    // Working with time in Solidity - a function that is called only after a current time
    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime); // gets the timestamp of the block
        _;
    }

    function addPerTime(string memory _firstName, string memory _lastName) public onlyWhileOpen {
        peopleCount+=1;
        peopleMapping[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
}
