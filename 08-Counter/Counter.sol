// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Counter {
    // inisialisasi variable count secara public
    uint public count;

    // fungsi yang digunakan untuk menambahkan variable count
    function increment() external {
        // variable count ditambah dengan 1
        count += 1;
    }

    // fungsi yang digunakan untuk mengurangi variable count
    function decrement() external {
        // variable count dikurangin dengan 1
        count -= 1;
    }
}