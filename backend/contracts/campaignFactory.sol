// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./Campaign.sol";
import "./NGORegistry.sol";
import "./DonorRegistry.sol";

contract CampaignFactory {
    event CampaignCreated(uint goal, address benefitedNGO, address campaignAddress);

    address[] public campaigns;
    mapping(address => bool) public activeCampaign;

    NGORegistry public ngoRegistry;
    DonorRegistry public donorRegistry;

    constructor(address ngoRegistryAddress, address donorRegistryAddress) {
        ngoRegistry = NGORegistry(ngoRegistryAddress);
        donorRegistry = DonorRegistry(donorRegistryAddress);
    }

    function createCampaign(uint goal) public {
        require(ngoRegistry.isRegisteredNGO(msg.sender), "NGO not registered");
        require(!donorRegistry.isRegisteredDonor(msg.sender), "Donor cannot create campaign");
        require(goal > 0, "Goal should be greater than 0");
        Campaign newCampaign = new Campaign(goal, payable(msg.sender), address(donorRegistry));
        campaigns.push(address(newCampaign));
        activeCampaign[address(newCampaign)] = true;
        emit CampaignCreated(goal, msg.sender, address(newCampaign));
    }

    function getActiveCampaigns() public view returns (address[] memory) {
        address[] memory temp = new address[](campaigns.length);
        uint activeCampaignsCount = 0;

        for (uint i = 0; i < campaigns.length; i++) {
            if (activeCampaign[campaigns[i]]) {
                temp[activeCampaignsCount] = campaigns[i];
                activeCampaignsCount++;
            }
        }

        address[] memory activeCampaigns = new address[](activeCampaignsCount);
        for (uint i = 0; i < activeCampaignsCount; i++) {
            activeCampaigns[i] = temp[i];
        }
        return activeCampaigns;
    }
}