// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// If Else merupakan struktur kontrol(control flow) yang digunakan untuk perbandingan
// semisal, dalam program dibawah adalah memunculkan angka 10 ketika apakah nilai _x kurang dari 10,
// pada else if adalah jika nilai _x kurang dari 20 maka akan menampilkan 20,
// namun jika nilai _x diluar kurang dari 20 ataupun 10 maka akan menampilkan 0

// urutan pengecekan dimulai dari atas kebawah, jadi semisal input nilai _x adalah 30
// maka, akan dicek dahulu, apakah _x kurang dari 10? jika tidak, maka lanjut kebawah,
// apakah _x kurang dari 20? jika salah maka lanjut proses berikutnya,
// yang dimana _x akan menampilkan 0

contract IfElse {

    function ifElse(uint _x) external pure returns (uint) {

        // statement mengecek apakah nilai _x kurang dari 10
        if (_x <= 10) {
            // jika benar maka tampilkan 10
            return 10;

        // statement mengecek apakah nilai _x kurang dari
        } else if (_x <= 20) {
            // jika benar akan ditampilkan 10
            return 20;

        // dan jika statement diluar dari itu semua maka akan ditampilkan 0
        } else {
            return 0;
        }
    }
}