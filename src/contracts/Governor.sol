// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "@openzeppelin/contracts/governance/IGovernor.sol";
import "@openzeppelin/contracts/governance/Governor.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorSettings.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorCountingSimple.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotesQuorumFraction.sol";

contract MyGovernor is
    Governor,
    GovernorSettings,
    GovernorCountingSimple,
    GovernorVotes,
    GovernorVotesQuorumFraction
{
    constructor(
        IVotes _token
    )
        Governor("MyGovernor")
        GovernorSettings(28800 /* 1 day */, 201600 /* 1 week */, 0)
        GovernorVotes(_token)
        GovernorVotesQuorumFraction(4)
    {}

    function votingDelay()
        public
        pure
        override(IGovernor, GovernorSettings)
        returns (uint256)
    {
        return 1; // 1 block
    }

    function proposalThreshold()
        public
        view
        virtual
        override(Governor, GovernorSettings)
        returns (uint256)
    {
        return 0;
    }
}
