//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

import "./ERC20_token.sol"; // Import your ERC20Token if in another file

contract WeightedVoting {
    struct Proposal {
        string description;
        uint voteCount; // weighted votes based on token balance
        bool exists;
    }

    ERC20Token public token;              // your ERC20 token
    uint public proposalCount;
    mapping(uint => Proposal) public proposals;
    mapping(uint => mapping(address => bool)) public hasVoted;

    event ProposalCreated(uint id, string description);
    event Voted(address voter, uint proposalId, uint weight);


    constructor(address tokenAddress) {
        require(tokenAddress != address(0), "Invalid token address");
        token = ERC20Token(tokenAddress);
    }

    function createProposal(string memory description) external {
        proposalCount++;
        proposals[proposalCount] = Proposal(description, 0, true);
        emit ProposalCreated(proposalCount, description);
    }

    function vote(uint proposalId) external {
        require(proposals[proposalId].exists, "Proposal does not exist");
        require(!hasVoted[proposalId][msg.sender], "Already voted");

        uint weight = token.balanceOf(msg.sender);
        require(weight > 0, "No voting power");

        proposals[proposalId].voteCount += weight;
        hasVoted[proposalId][msg.sender] = true;

        emit Voted(msg.sender, proposalId, weight);
    }

    function winningProposal() external view returns (uint id, string memory description, uint voteCount) {
        uint maxVotes = 0;
        uint winningId = 0;

        for (uint i = 1; i <= proposalCount; i++) {
            if (proposals[i].voteCount > maxVotes) {
                maxVotes = proposals[i].voteCount;
                winningId = i;
            }
        }

        Proposal memory p = proposals[winningId];
        return (winningId, p.description, p.voteCount);
    }
}
