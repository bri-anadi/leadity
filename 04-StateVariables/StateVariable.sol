// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// state variable secara sederhana adalah menyimpan data kedalam blockchain
// dapat bertipe lokal maupun global variable
// state variable disimpan permanen

contract StateVariable {
    // contoh state variable
    uint public myInt = 123;

    function localVariable() pure external {
        // local variable berarti variable hanya dapat dipanggil dalam fungsi itu sendiri
        uint integer = 12345;
        integer;
    }
}