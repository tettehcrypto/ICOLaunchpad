// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract ICO is ERC20, Ownable, ReentrancyGuard {
    
    // Sample constructor
    constructor(uint256 tokenAmount) ERC20("BasicCoin", "BSC") {
      _mint(_msgSender(), tokenAmount*(10**uint256(decimals())));
    }

    function mint(address account, uint256 amount) public onlyOwner returns (bool success) {
      require(account != address(0) && amount != uint256(0), "KingdomSale: function mint invalid input");
      _mint(account, amount);
      return true;
    }

    function burn(address account, uint256 amount) public onlyOwner returns (bool success) {
      require(account != address(0) && amount != uint256(0), "KingdomSale: function burn invalid input");
      _burn(account, amount);
      return true;
    }

    function buy() public payable nonReentrant returns (bool sucess) {
      require(msg.sender.balance >= msg.value && msg.value != 0 ether, "KingdomSale: function buy invalid input");
      uint256 amount = msg.value * 1000;
      _transfer(owner(), _msgSender(), amount);
      return true;
    }

    function withdraw(uint256 amount) public onlyOwner returns (bool success) {
      require(amount <= address(this).balance, "KingdomSale: function withdraw invalid input");
      payable(_msgSender()).transfer(amount);
      return true;
    }
}
