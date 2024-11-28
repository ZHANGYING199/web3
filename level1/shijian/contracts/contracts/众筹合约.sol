// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract GrowdFund {
    address public immutable beneficiary;
    uint256 public immutable fundingGoal;
    uint256 public fundingAmount;
    mapping(address => uint256) public funders;
    mapping(address => bool) private fundersInserted;
    address[] public fundersKey;

    bool public available = true;

    //  部署时，设置受益人，和金额
    constructor(address _beneficiary, uint256 _goal) {
        beneficiary = _beneficiary;
        fundingGoal = _goal;
    }

    function contrubute() external payable {
        require(avaialble, "crowdfund is closed");

        uint256 potentialFundingAmount = fundingAmount + msg.value;
        uint256 refundAmount = 0;

        if(potentialFundingAmount > fundingGoal) {
            refundAmount = potentialFundingAmount - fundingGoal;
            funders[msg.sender] += (msg.value - refundAmount);
            fundingAmount += (msg.value - refundAmount);
        } else {
            funders[msg.sender] += msg.value;
            fundingAmount += msg.value;
        }

        if(!fundersInserted[msg.sender]) {
            fundersInserted[msg.sender] = true;
            fundersKey.push(msg.sender);
        }

        if (refundAmount > 0) {
            payable(msg.sender).transfer(refundAmount);
        }
    }

    function close() external returns(bool) {
        if(fundingAmount < fundingGoal) {
            return false;
        }

        uint256 amount = fundingAmount;
        fundingAmount = 0;
        available = false;
        payable(beneficiary).transfer(amount);
        return true;
    }

    function fundersLength() public view returns(uint256) {
        return fundersKey.length;
    }
}