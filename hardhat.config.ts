import { HardhatUserConfig } from "hardhat/config";
import "@nomiclabs/hardhat-waffle";

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: "0.8.9",
      },
      {
        version: "0.6.0",
      },
    ],
  },
  // networks: {
  //   hardhat: {
  //     mining: {
  //       auto: false,
  //       interval: 2000,
  //     },
  //   },
  // },
  defaultNetwork: "localhost",
};

export default config;
