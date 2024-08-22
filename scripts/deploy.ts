import { ethers } from "hardhat";

async function main() {
    const ShapeAreaCalculator = await ethers.getContractFactory("ShapeAreaCalculator");
    const shapeAreaCalculator:any = await ShapeAreaCalculator.deploy();

    await shapeAreaCalculator.deployed();

    console.log("ShapeAreaCalculator deployed to:", shapeAreaCalculator.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
