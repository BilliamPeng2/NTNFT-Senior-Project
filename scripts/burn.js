const hre = require("hardhat");
async function main() {
  const NFT = await hre.ethers.getContractFactory("NTNFT");
  const CONTRACT_ADDRESS = "<address>"
  const contract = NFT.attach(CONTRACT_ADDRESS);
  const approve = await contract.setApprovalForAll("<address>", true)
  console.log("approved:", approve)
  const burned = await contract.burn(2);
  console.log("burned:", burned)
}
main().then(() => process.exit(0)).catch(error => {
  console.error(error);
  process.exit(1);
});
