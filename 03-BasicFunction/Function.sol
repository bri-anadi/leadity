// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract BasicFunction {
    // event atau property x dan y bertipe uint
    // properti external digunakan agar fungsi dapat dibaca dan dipanggil diluar kontrak
    // pure artinya hanya fungsi baca saja
    // returns artinya fungsi mengembalikan nilai bertipe uint

    // fungsi pertambahan
    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }

    // fungsi pengurangan
    function sub(uint x, uint y) external pure returns (uint) {
        return x - y;
    }
}