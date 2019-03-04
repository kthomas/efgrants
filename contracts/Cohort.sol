pragma solidity ^0.5.4;

import "openzeppelin-solidity/contracts/payment/escrow/ConditionalEscrow.sol";
import "openzeppelin-solidity/contracts/ownership/Secondary.sol";
import "./GrantApplication.sol";
import "./Unicorn.sol";

/**
 * A Cohort is managed by the Foundation and also serves as a conditional escrow where
 * the aggregate of all funds granted by the Foundation to grantees in the cohort are
 * deposited. Grantees (Unicorns) may conditionally withdraw from the Cohort escrow up
 * to their allocation and in accordance with project milestones, if applicable.
 */
contract Cohort is ConditionalEscrow, Secondary {

    /** Block when grant applications are accepted by the cohort. */
    uint public applicationsOpenBlock;

    /** Block when grant applications are closed and no longer accepted by the cohort. */
    uint public applicationsCloseBlock;

    /** Human-readable cohort name. */
    string public name;

    /** List of community-submitted grant applications for consideration. */
    GrantApplication[] public applications;

    /** Unicorns are promoted from their originating GrantApplication and may conditionally withdrawal from escrow. */
    Unicorn[] public unicorns;

    constructor(
        uint _applicationsOpenBlock,
        uint _applicationsCloseBlock,
        string memory _name
    ) public ConditionalEscrow() Secondary() {
        applicationsOpenBlock = _applicationsOpenBlock;
        applicationsCloseBlock = _applicationsCloseBlock;
        name = _name;
    }

    function() public payable onlyPrimary {
        escrow.transfer(msg.value);
    }

    /**
     * Apply to be considered for inclusion in this cohort.
     */
    function submitApplication() public onlyAcceptingApplications returns (address _grantApplication) {
        revert("impl possible");
    }

    /**
     * Approve a grant application, promote the underlying
     * Unicorn and forward all wei to the accepted project.
     */
    function approveGrant() public payable onlyPrimary {
        escrow.transfer(msg.value);
    }

    function isAcceptingApplications() public view returns (bool) {
        return block.number >= applicationsOpenBlock && block.number < applicationsCloseBlock;
    }

    modifier onlyAcceptingApplications() {
        if (!isAcceptingApplications()) revert("cohort is not accepting applications at this time");
        _;
    }
}
