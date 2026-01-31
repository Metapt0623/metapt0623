const hre = require("hardhat");

async function main() {
  // 这里的名字 "Protocol176" 必须和上面 contract 后面的一致
  const Contract = await hre.ethers.getContractFactory("Protocol176");
  
  const myWallet = "0x3bfda04ad60df30a7adf66702c68b339f1c4d17f";

  console.log("正在部署 MetaPToken (TBB)...");

  // 将五个分发地址全部设为你的钱包，确保 17.6 亿全额归位
  const token = await Contract.deploy(myWallet, myWallet, myWallet, myWallet, myWallet);
  
  await token.waitForDeployment();

  const address = await token.getAddress();
  console.log("------------------------------------------");
  console.log("部署成功！");
  console.log("TBB 合约地址:", address);
  console.log("------------------------------------------");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
