const hre = require("hardhat");

async function main() {
  const SimpleBank = await hre.ethers.getContractFactory("SimpleBank");
  const bank = await SimpleBank.deploy();
  await bank.waitForDeployment();
  console.log(`SimpleBank deployed to: ${await bank.getAddress()}`);
}

main().catch((error) => {
  console.error("Deployment failed:", error);
  process.exitCode = 1;
});
