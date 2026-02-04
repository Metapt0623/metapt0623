// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Protocol176 is ERC20, Ownable {
    uint256 public constant BURN_RATE = 2; 
    constructor() ERC20("MetaPToken", "TBB") Ownable(msg.sender) {
        _mint(msg.sender, 1760000000 * 10**18);
    }
    function _update(address from, address to, uint256 value) internal virtual override {
        if (from == address(0) || to == address(0)) {
            super._update(from, to, value);
            return;
        }
        uint256 burnAmount = (value * BURN_RATE) / 100;
        super._update(from, address(0), burnAmount);
        super._update(from, to, value - burnAmount);
    }
}
