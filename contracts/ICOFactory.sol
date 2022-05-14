// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ICO.sol';

contract ICOFactory {
    address[] public deployedICO;

    function createIco(uint tokenAmount) public {
        address newICO = address(new ICO(tokenAmount));
        deployedICO.push(newICO);
    }

    function getDeployedCampaigns() public view returns (address[] memory) {
        return deployedICO;
    }
}