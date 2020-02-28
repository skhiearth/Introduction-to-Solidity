pragma solidity ^0.5.1;

contract MyContract {
    // Data type made public so that it is available to everyone and also setting a default value
    string public value = "DEFAULT";

    // A constant data member
    string public constant value2 = "DEFAULT2";

    // Other variable data types in Solidity
    bool public flag = true;
    int public myInt = -1;
    uint public myUInt = 1;
    uint8 public myUInt8 = 8;
    uint256 public myUInt256 = 256;

    /** Solidity has a built-in getter function which is automatically created and bears the same name as
     * a public member variable.
    */

    // Adding `memory` to function return type and arguments to support Solidity v0.5.1 syntax
    function set(string memory _value) public {
        value = _value;
    }

    // Enumeration - An enumerated list
    enum State { waiting, ready, active }
    State public state;

    constructor() public {
        state = State.waiting;
    }

    function activate() public {
        state = State.active;
    }

    function isActive() public view returns(bool) {
        return state == State.active;
    }

    // Structure - A way for us to define custom data structures
    Person[] public people; //An array of various instances of type `Person`
    uint256 public peopleCount = 0;

    mapping(uint256 => Person) public peopleMapping; /** Mapping - An associative array, works like a HashMap.
    Here, the `uint256` acts like the key and `Person` is the value.
    */

    struct Person {
        uint id;
        string _firstName;
        string _lastName;
    }

    function addPerson(string memory _firstName, string memory _lastName) public {
        peopleCount+=1;

        people.push(Person(peopleCount, _firstName, _lastName)); // Creating a new `person` and adding to the array
        // `push` works same as appending elements to an array

        peopleMapping[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

}
