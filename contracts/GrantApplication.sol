pragma solidity ^0.5.4;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "./Unicorn.sol";

contract GrantApplication is Ownable {

    Unicorn public unicorn;

    uint public applicationBlock;
    uint public decisionBlock;

    bool public accepted;

    constructor() public Ownable() {
        applicationBlock = block.number;
    }

    function reject() public onlyOwner onlyPendingDecision {
        accepted = false;
    }
    
    modifier onlyPendingDecision() {
        if (decisionBlock > uint(0)) revert("no decision has been made on this application");
        _;
    }
}
