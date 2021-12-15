const hre = require("hardhat");
async function main() {
  const NFT = await hre.ethers.getContractFactory("BasicNFT");
  const URI = "ipfs://<pinata ID>"
  const WALLET_ADDRESS = "<address>"
  const CONTRACT_ADDRESS = "<address>"
  const contract = NFT.attach(CONTRACT_ADDRESS);
  await contract.mint(WALLET_ADDRESS, URI);
  console.log("NFT minted:", contract);
}
main().then(() => process.exit(0)).catch(error => {
  console.error(error);
  process.exit(1);
});
