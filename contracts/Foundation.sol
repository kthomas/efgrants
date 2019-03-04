pragma solidity ^0.5.4;

import "./Cohort.sol";

contract Foundation is Ownable {

    Cohort[] public cohorts;

    constructor() public Ownable() {

    }

    /**
     * Define a new cohort.
     */
    function newCohort(
        uint _applicationsOpenBlock,
        uint _applicationsCloseBlock,
        string memory _name
    ) public onlyOwner returns (address _cohort) {
        Cohort cohort = new Cohort(_applicationsOpenBlock, _applicationsCloseBlock, _name);
        cohorts.push(cohort);
        _cohort = address(cohort);
    }

    /**
     * View the upcoming cohort.
     *
     * FIXME: This will break when 2 Cohorts are defined to begin in the future
     * since this function just wants the last one...
     */
    function upcomingCohort() public view returns (address _cohort) {
        if (cohorts.length > 0) {
            Cohort cohort = cohorts[cohorts.length - 1];
            if (cohort.applicationsOpenBlock > block.number) {
                _cohort = address(cohort);
            }
        }
    }
}
