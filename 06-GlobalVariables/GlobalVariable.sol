// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract GlobalVariable {
    // view type merupakan property read only yang dapat membaca state variable dan local variable 
    
    function globalFunc() external view returns (address, uint, uint) {
        // msg.sender merupakan variable yang digunakan untuk mengambil akun / alamat dari pemanggil
        address sender = msg.sender;

        // mendapatkan waktu blok dibuat ketika fungsi globalFunc dipanggil
        // tipedata block.timestamp adalah uint
        uint timestamp = block.timestamp;

        // mendapatkan posisi pada blok berapa
        // tipedata block.number adalah uint
        uint blockNumber = block.number;

        // mengembalikan nilai
        return (sender, timestamp, blockNumber); 
    }
}