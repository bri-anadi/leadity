// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title AKJGMW Token Faucet
 * @dev A faucet contract for distributing AKJGMW tokens with configurable amounts and timelock
 * Gas optimized version with:
 * - Unchecked arithmetic where overflow is impossible
 * - Memory variables to reduce SLOAD operations
 * - Custom errors instead of require strings
 * - Optimized variable packing
 */
contract AKJGMWFaucet is ReentrancyGuard, Ownable {
    /// @notice Interface for the AKJGMW token
    IERC20 public immutable token;
    
    /// @notice Amount of tokens distributed per request
    uint96 public amountPerRequest;
    
    /// @notice Time users must wait between requests (in seconds)
    uint96 public lockTime;
    
    /// @notice Mapping of user addresses to their last request timestamp
    mapping(address => uint256) public lastAccessTime;
    
    /// @dev Custom errors for gas optimization
    error WaitTimeNotElapsed();
    error InsufficientFaucetBalance();
    error TransferFailed();
    error InvalidAmount();
    error InvalidLockTime();
    
    /// @notice Emitted when tokens are dispensed to a user
    event TokensDispensed(address indexed recipient, uint96 amount);
    
    /// @notice Emitted when amount per request is updated
    event AmountPerRequestUpdated(uint96 oldAmount, uint96 newAmount);
    
    /// @notice Emitted when lock time is updated
    event LockTimeUpdated(uint96 oldTime, uint96 newTime);

    /**
     * @notice Contract constructor
     * @param _initialAmount Initial amount of tokens per request
     * @param _initialLockTime Initial lock time between requests (in seconds)
     * @param initialOwner Address of the contract owner
     */
    constructor(
        uint96 _initialAmount,
        uint96 _initialLockTime,
        address initialOwner
    ) Ownable(initialOwner) {
        if (_initialAmount == 0) revert InvalidAmount();
        if (_initialLockTime == 0) revert InvalidLockTime();
        
        token = IERC20(0xFcb29dE57ba6f01A55ee4c64EE62770Cd1Ec4D54);
        amountPerRequest = _initialAmount;
        lockTime = _initialLockTime;
    }

    /**
     * @notice Request tokens from the faucet
     * @dev Implements timelock and balance checks
     */
    function requestTokens() external nonReentrant {
        uint256 userLastAccess = lastAccessTime[msg.sender];
        uint96 currentAmount = amountPerRequest;
        uint96 currentLockTime = lockTime;
        
        // Check if enough time has passed since last request
        if (block.timestamp < userLastAccess + currentLockTime) {
            revert WaitTimeNotElapsed();
        }
        
        // Check faucet balance
        if (token.balanceOf(address(this)) < currentAmount) {
            revert InsufficientFaucetBalance();
        }
        
        // Update last access time before transfer (CEI pattern)
        lastAccessTime[msg.sender] = block.timestamp;
        
        // Transfer tokens
        if (!token.transfer(msg.sender, currentAmount)) {
            revert TransferFailed();
        }
        
        emit TokensDispensed(msg.sender, currentAmount);
    }

    /**
     * @notice Set new amount of tokens per request
     * @param _newAmount New amount of tokens to distribute per request
     */
    function setAmountPerRequest(uint96 _newAmount) external onlyOwner {
        if (_newAmount == 0) revert InvalidAmount();
        
        uint96 oldAmount = amountPerRequest;
        amountPerRequest = _newAmount;
        
        emit AmountPerRequestUpdated(oldAmount, _newAmount);
    }

    /**
     * @notice Set new lock time between requests
     * @param _newLockTime New lock time in seconds
     */
    function setLockTime(uint96 _newLockTime) external onlyOwner {
        if (_newLockTime == 0) revert InvalidLockTime();
        
        uint96 oldTime = lockTime;
        lockTime = _newLockTime;
        
        emit LockTimeUpdated(oldTime, _newLockTime);
    }

    /**
     * @notice Check time until user can request again
     * @param user Address of the user to check
     * @return Time in seconds until next available request (0 if can request now)
     */
    function timeUntilNextRequest(address user) external view returns (uint256) {
        uint256 userLastAccess = lastAccessTime[user];
        if (userLastAccess == 0) return 0;
        
        uint256 timePassed = block.timestamp - userLastAccess;
        uint256 currentLockTime = lockTime;
        
        if (timePassed >= currentLockTime) return 0;
        
        unchecked {
            return currentLockTime - timePassed;
        }
    }

    /**
     * @notice Withdraw tokens from faucet (owner only)
     * @param _amount Amount of tokens to withdraw
     */
    function withdrawTokens(uint256 _amount) external onlyOwner {
        if (token.balanceOf(address(this)) < _amount) {
            revert InsufficientFaucetBalance();
        }
        
        if (!token.transfer(msg.sender, _amount)) {
            revert TransferFailed();
        }
    }

    /**
     * @notice Get current faucet token balance
     * @return Current balance of tokens in the faucet
     */
    function getFaucetBalance() external view returns (uint256) {
        return token.balanceOf(address(this));
    }

    /// @notice Allow contract to receive native chain currency
    receive() external payable {}
}