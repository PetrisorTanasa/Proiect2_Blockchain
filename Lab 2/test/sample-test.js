const { expect } = require("chai");
const { ethers, waffle } = require("hardhat");

describe("SWAP", function () {
  it("Test swap", async function () {
    const provider = waffle.provider;

    const Greeter = await ethers.getContractFactory("Greeter");
    const greeter = await Greeter.deploy();
    await greeter.deployed();

    const [owner, addr1, addr2] = await ethers.getSigners();

    const balance0 = await provider.getBalance(addr1.address);
    console.log(balance0)

    const swapTx = await greeter.connect(addr1).swapETHToUSDT({value: 100000000000});
    await swapTx.wait();

    const balance1 = await provider.getBalance(addr1.address);
    console.log(balance1)
  });
});