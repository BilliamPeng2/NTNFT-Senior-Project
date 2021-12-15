const hre = require("hardhat");
async function main() {
  const NFT = await hre.ethers.getContractFactory("FrozenNFT");
  const nft = await NFT.deploy();
  await nft.deployed();
  console.log("NFT deployed to:", nft.address);
  const contract = NFT.attach(nft.address);
  await contract.pause()
}
main().then(() => process.exit(0)).catch(error => {
  console.error(error);
  process.exit(1);
});
