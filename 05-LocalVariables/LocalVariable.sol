// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// local variable terdapat dalam satu fungsi 
// program ini akan menjelaskan tentang mengubah property public(didalam kontrak) dari dalam fungsi external

contract LocalVariable {
    // inisialisasi variable
    uint public a;
    bool public b;
    address public addr;

    // ketika fungsi ini diakses, maka nilai a, b, dan addr akan berubah
    // ketika fungsi selesai dijalankan maka variable lokal (x dan y) akan hilang atau tidak disimpan
    function localFunc() external {
        uint x = 111;
        bool y = false;
        x += 222; //x = x + 222;
        y = true;

        // memasukkan nilai kedalam variable public 
        a = 123;
        b = false;
        addr = address(1);
    }
}