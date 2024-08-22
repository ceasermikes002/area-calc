# Shape Area Calculator

## Overview

The **Shape Area Calculator** is a Solidity smart contract designed to calculate the area of different geometric shapes, including triangles, rectangles, and squares. This project includes a Hardhat setup for development, testing, and deployment of the smart contract to the Sepolia testnet.

## Features

- **Calculate Triangle Area:** Function to compute the area of a triangle.
- **Calculate Rectangle Area:** Function to compute the area of a rectangle.
- **Calculate Square Area:** Function to compute the area of a square.

## Project Setup

### Prerequisites

- Node.js (>= 14.x)
- npm (>= 6.x) or Yarn

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/shape-area-calculator.git
   cd shape-area-calculator
   ```

2. **Install Dependencies**

   ```bash
   npm install
   ```

### Configuration

1. **Create a `.env` File**

   In the root directory of the project, create a `.env` file with the following content:

   ```plaintext
   INFURA_API_KEY=your_infura_api_key
   SEPOLIA_PRIVATE_KEY=your_sepolia_private_key
   ```

   Replace `your_infura_api_key` and `your_sepolia_private_key` with your actual keys.

### Contract Details

#### `ShapeAreaCalculator.sol`

This Solidity smart contract provides three functions to calculate the area of different shapes:

- **`calculateTriangleArea(uint256 base, uint256 height)`**: Returns the area of a triangle.
- **`calculateRectangleArea(uint256 length, uint256 width)`**: Returns the area of a rectangle.
- **`calculateSquareArea(uint256 side)`**: Returns the area of a square.

**File Path:** `contracts/ShapeAreaCalculator.sol`

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShapeAreaCalculator {
    // Function to calculate the area of a triangle
    function calculateTriangleArea(uint256 base, uint256 height) public pure returns (uint256) {
        return (base * height) / 2;
    }

    // Function to calculate the area of a rectangle
    function calculateRectangleArea(uint256 length, uint256 width) public pure returns (uint256) {
        return length * width;
    }

    // Function to calculate the area of a square
    function calculateSquareArea(uint256 side) public pure returns (uint256) {
        return side * side;
    }
}
```

### Deployment

1. **Compile the Contract**

   Compile the Solidity contract to generate the necessary artifacts:

   ```bash
   npx hardhat compile
   ```

2. **Deploy the Contract**

   Run the deployment script to deploy the contract to the Sepolia testnet:

   ```bash
   npx hardhat run scripts/deploy.ts --network sepolia
   ```

   Upon successful deployment, you will receive the contract address.

### Scripts

- **Deployment Script:** `scripts/deploy.ts`

   ```typescript
   import { ethers } from "hardhat";

   async function main() {
     const ShapeAreaCalculator = await ethers.getContractFactory("ShapeAreaCalculator");
     const shapeAreaCalculator = await ShapeAreaCalculator.deploy();
     await shapeAreaCalculator.deployed();
     console.log("ShapeAreaCalculator deployed to:", shapeAreaCalculator.address);
   }

   main().catch((error) => {
     console.error(error);
     process.exitCode = 1;
   });
   ```

### Configuration File

- **Hardhat Configuration:** `hardhat.config.ts`

   ```typescript
   import { HardhatUserConfig } from "hardhat/config";
   import "@nomicfoundation/hardhat-toolbox";
   import "@typechain/hardhat";
   import * as dotenv from "dotenv";

   dotenv.config();

   const INFURA_API_KEY = process.env.INFURA_API_KEY || "";
   const SEPOLIA_PRIVATE_KEY = process.env.SEPOLIA_PRIVATE_KEY || "";

   const config: HardhatUserConfig = {
     solidity: {
       version: "0.8.24",
       settings: {
         optimizer: {
           enabled: true,
           runs: 200,
         },
       },
     },
     networks: {
       sepolia: {
         url: `https://sepolia.infura.io/v3/${INFURA_API_KEY}`,
         accounts: [`0x${SEPOLIA_PRIVATE_KEY}`],
       },
     },
     etherscan: {
       apiKey: process.env.ETHERSCAN_API_KEY || "",
     },
     typechain: {
       outDir: "typechain",
       target: "ethers-v6",
     },
   };

   export default config;
   ```

### Contributing

Feel free to open issues and submit pull requests to improve the project. Contributions are welcome!

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
