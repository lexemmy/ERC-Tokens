// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LexToken is ERC20, Ownable {

    uint256 public tokensPerEth = 1000;

    constructor() ERC20("Lex Token", "LTK") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function buyToken(address receiver, uint256 amount) public returns (uint256){
                
        uint256 tokenCost = amount * tokensPerEth;
        
        _mint(receiver, tokenCost);
        
        return tokenCost;
    }

}