# Quick Guide: Deploy Smart Contract to Sepolia using Remix

## Deployment Steps

### 1. Setup Environment
- Go to [Remix IDE](https://remix.ethereum.org/)
- Create new file: `HelloWorld.sol`
- Copy-paste contract code

### 2. Compile
- Click "Solidity Compiler" tab
- Select compiler `0.8.0` or higher
- Click "Compile"

### 3. Setup MetaMask
- Install MetaMask
- Add Sepolia network:
  * Network: `Sepolia`
  * RPC: `https://sepolia.infura.io/v3/`
  * Chain ID: `11155111`
  * Symbol: `ETH`

### 4. Get Test ETH
- Visit [Sepolia Faucet](https://sepoliafaucet.com/)
- Enter your wallet address
- Wait for ETH

### 5. Deploy
- Click "Deploy & Run" tab
- Select "Injected Provider - MetaMask"
- Click "Deploy"
- Confirm in MetaMask

### 6. Test Contract
- Get contract address
- Click `getMessage()`
- Try `setMessage()` with new text

## Quick Tips
- Always check Sepolia network
- Save contract address
- Check ETH balance
- Verify on [Sepolia Etherscan](https://sepolia.etherscan.io/)