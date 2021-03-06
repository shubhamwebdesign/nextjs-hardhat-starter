// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract Token {
    string public name = "HardHat Token";
    string public symbol = "HHT";
    address public owner;
    uint256 public totalSupply = 10000;
    mapping(address => uint256) balances;

    constructor() {
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        console.log("Sender has a balance of %s tokens", balances[msg.sender]);
        console.log("Sender is sending %s tokens to %s", amount, to);
        require(balances[msg.sender] >= amount, "Not Enough Balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        return false;
    }
}
