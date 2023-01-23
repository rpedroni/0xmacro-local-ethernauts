import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  // Run 10 times
  // TODO: This only works for automining ~ i.e. 1 tx per block, since the victim protects against multiple txs in the same block
  // We'd be able to wait for another block but would have to set high gas in case to beat someone else's tx
  for (let i = 0; i < 10; i++) {
    await attacker.hackContract();
  }
};

export default helper;
