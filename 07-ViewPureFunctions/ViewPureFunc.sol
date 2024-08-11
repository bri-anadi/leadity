// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// gasfee view lebih mahal daripada pure

contract ViewPureFunc {
    uint public number;

    // gasfee tanpa property (329 gas)
    // gasfee dengan return (2437 gas)
    function viewFunc() external view returns (uint) {
        return number;
    }

    // gasfee tanpa property (307 gas)
    // gasfee dengan return (315 gas)
    function pureFunc() external pure returns (uint) {
        return 10;
    }

    // menggunakan property view karena menggunakan variable number 
    function add(uint x) external view returns (uint) {
        return number + x;
    }

    // menggunakan pure karena menggunakan variable lokal dari parameter
    function dec(uint x, uint y) external pure returns (uint) {
        return x - y;
    }
}