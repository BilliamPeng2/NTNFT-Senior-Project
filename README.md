# NTNFT-Senior-Project
This repository contains the contract code and scripts to deploy and mint tokens for a basic NFT, a Pausable NTNFT, and a Ownable NTNFT.
The contracts are .sol files in the contracts folder.
The scripts are .js files in the scripts folder.
hardhat.config.js contains all the different network configurations

## Installation Guide
To install hardhat, run
```bash
npm install --save-dev hardhat
```

To connect your crypto wallet, get your private key and create a .env file
that sets PRIVATE_KEY=YOUR_PRIVATE_KEY, and then run
```bash
npm i dotenv
```

We use the Open Zeppelin ERC-721 contracts. To get them, run
```bash
npm install @openzeppelin/contracts
```

To run a script, replace the placeholder address with the actual contract or wallet addresses and run
```bash
npx hardhat run scripts/file_path --network matic_testnet
```
