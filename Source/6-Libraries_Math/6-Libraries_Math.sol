pragma solidity ^0.5.1;

// Import library from different file
import "Source/6-Libraries_Math/Math.sol";
import "Source/6-Libraries_Math/SafeMath.sol";

contract MyContract {
    using SafeMath for uint256;
    uint256 public value;
    uint256 public safeval;

    function calc(uint256 _value1, uint256 _value2) public {
        value = Math.divide(_value1, _value2);
        safeval = _value1.div(_value2);
    }
}
