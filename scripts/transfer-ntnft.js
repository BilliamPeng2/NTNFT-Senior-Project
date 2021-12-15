const hre = require("hardhat");
async function main() {
  const NFT = await hre.ethers.getContractFactory("FrozenNFT");
  const WALLET_ADDRESS = "<address>"
  const CONTRACT_ADDRESS = "<address>"
  const contract = NFT.attach(CONTRACT_ADDRESS);
  const transfer = contract.safeTransferFrom("<address>", "<address>", "tokenId")
  console.log("Transfered:", transfer);
}
main().then(() => process.exit(0)).catch(error => {
  console.error(error);
  process.exit(1);
});
