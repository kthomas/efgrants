pragma solidity ^0.5.4;

import "openzeppelin-solidity/contracts/ownership/Secondary.sol";

contract Unicorn is Secondary {

    // TODO: define storage for project milestones. etc.
    // TODO: this contract will be permitted to conditionally withdraw from Cohort escrow contract(s)
    
    constructor() public Secondary() {

    }
}
