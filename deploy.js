const hre = require("hardhat");

async function main() {
  // 注意：这里必须和你 .sol 文件里的 contract 名字一致
  const P176 = await hre.ethers.getContractFactory("Protocol176");
  const target = "0x3bfda04ad60df30a7adf66702c68b339f1c4d17f";

  console.log("正在启动部署...");
  const token = await P176.deploy(target, target, target, target, target);
  await token.waitForDeployment();

  console.log("------------------------------------------");
  console.log("部署成功！176协议合约地址:", await token.getAddress());
  console.log("------------------------------------------");
}

main().catch((error) => { console.error(error); process.exitCode = 1; });

