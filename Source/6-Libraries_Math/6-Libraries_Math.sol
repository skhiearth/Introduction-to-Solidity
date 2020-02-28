pragma solidity ^0.5.1;

// Import library from different file
import "Source/6-Libraries_Math/Math.sol";

contract MyContract {
    uint256 public value;

    function calc(uint256 _value1, uint256 _value2) public {
        value = Math.divide(_value1, _value2);
    }
}
