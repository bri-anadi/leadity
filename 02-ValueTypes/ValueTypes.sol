// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// Tipedata = value(boolean, int, uint, string) dan referensi(array, mapping)
contract ValueTypes {
    bool public b = true;
    
    // unsigned berarti angka harus diatas 0 atau tidak boleh negatif
    // uint = unsigned integer
    // uint secara default uint256
    // uint256 = 0 sampai 2**256 - 1
    // uint32  = 0 sampai 2**32 - 1
    // uint8   = 0 sampai 2**8 - 1
    uint public u = 123;

    // int merupakan tipedata yang dapat diisi dengan minus atau negatif
    // int256 = -2**255 sampai 2**255 - 1
    // int128 = -2**127 sampai 2**127 - 1
    int public i = -123;

    // untuk mengetahui berapa nilai minimum dari tipedata int
    int public minInt = type(int).min;

    // untuk mengetahui nilai maksimum dari tipedata int
    int public maxInt = type(int).max;

    // address merupakan tipedata yang digunakan untuk menyimpan alamat ethereum berupa string
    address public addr = 0x633AEc59286b51714c29495cD3170F38155739a4;

    // bytes tipedata jika bermain dengan kriptografi hashing
    // tipedata bytes harus didefinisikan seperti bytes32, bytes16
    // enkripsi yang digunakan adalah keccak256
    bytes32 public bt = 0x4f3217ee3b2ae134eb01ca5c30f93b1b99eaa7450a7be478af081966e12c2a21;
}