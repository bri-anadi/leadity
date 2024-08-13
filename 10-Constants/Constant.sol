// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// constant merupakan sebuah tipedata dalam variable yang sudah diinisialisasi dengan nilainya tidak dapat diubah

contract Constant {
    // tipedata constant berupa nilai 10 yang tidak bisa dirubah atau replace
    uint public constant constUinteger = 10;

    // tipedata tanpa const variable dengan nilai yang dapat diubah
    uint public uinteger = 20;

    function unint() external view returns (uint) {
        return uinteger;
    }
}