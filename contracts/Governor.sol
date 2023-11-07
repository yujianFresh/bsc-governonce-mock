// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {IGovernor} from '@openzeppelin/contracts/governance/IGovernor.sol';
import {Governor} from '@openzeppelin/contracts/governance/Governor.sol';
import {GovernorSettings} from '@openzeppelin/contracts/governance/extensions/GovernorSettings.sol';
import {GovernorCountingSimple} from '@openzeppelin/contracts/governance/extensions/GovernorCountingSimple.sol';
import {GovernorVotes, IVotes} from '@openzeppelin/contracts/governance/extensions/GovernorVotes.sol';
import {GovernorVotesQuorumFraction} from '@openzeppelin/contracts/governance/extensions/GovernorVotesQuorumFraction.sol';

contract MyGovernor is Governor, GovernorSettings, GovernorCountingSimple, GovernorVotes, GovernorVotesQuorumFraction {
    constructor(
        IVotes _token
    )
        Governor('MyGovernor')
        GovernorSettings(28800 /* 1 day */, 201600 /* 1 week */, 0)
        GovernorVotes(_token)
        GovernorVotesQuorumFraction(4)
    {}

    function votingDelay() public pure override(IGovernor, GovernorSettings) returns (uint256) {
        return 1; // 1 block
    }

    function proposalThreshold() public view virtual override(Governor, GovernorSettings) returns (uint256) {
        return 0;
    }
}
