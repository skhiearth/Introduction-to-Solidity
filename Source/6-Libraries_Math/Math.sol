pragma solidity ^0.5.1;

// Library Declaration
library Math {
    function divide(uint256 a, uint256 b) internal pure returns(uint256) {
        require(b > 0);
        uint256 c = a / b;
        return c;
    }
}
