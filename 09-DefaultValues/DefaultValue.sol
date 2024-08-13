// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract DefaultValue {
    // nilai default tiap tipe data
    bool public boolean; // false
    uint public uinteger; // 0 [uint256]
    int public integer; // 0 [int256]
    string public str; // "" 
    address public addr; // 0x0000000000000000000000000000000000000000 (40 zeros) atau address(0)
    bytes32 public b32; // 0x0000000000000000000000000000000000000000000000000000000000000000 (64 zeros) atau bytes(0)
}