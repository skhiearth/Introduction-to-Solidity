pragma solidity >=0.4.22 <0.7.0;

contract Timelock{
    
    address payable beneficiary;
    uint256 releaseTime;
    
    constructor
    (
        address payable _beneficiary,
        uint256 _releaseTime
    )
        public 
        payable
    {
        require(_releaseTime > block.timestamp);
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }
    
    function release() public {
        require(block.timestamp >= releaseTime);
        address(beneficiary).transfer(address(this).balance);
    }
    
}

 
