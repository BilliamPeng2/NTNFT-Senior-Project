const hre = require("hardhat");
async function main() {
  const NFT = await hre.ethers.getContractFactory("FrozenNFT");
  const CONTRACT_ADDRESS = "<address>"
  const contract = NFT.attach(CONTRACT_ADDRESS);
  const paused = await contract.paused();
  console.log("paused?:", paused)
}
main().then(() => process.exit(0)).catch(error => {
  console.error(error);
  process.exit(1);
});
