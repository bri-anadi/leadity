// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; // Menggunakan versi compiler terbaru yang stabil

contract HelloWorld {
    // Menggunakan immutable untuk owner karena tidak akan berubah
    address public immutable owner;
    
    // Menambahkan event untuk logging perubahan
    event MessageChanged(string oldMessage, string newMessage, address changedBy);
    
    // Menggunakan bytes32 lebih hemat gas dibanding string
    // Tapi kita tetap bisa menggunakan string untuk fleksibilitas
    string private message;
    
    // Custom error lebih hemat gas dibanding require dengan string
    error NotOwner();
    error EmptyMessage();
    
    constructor() {
        message = "Hello World!";
        owner = msg.sender;
    }
    
    // Modifier untuk mengecek owner
    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }
    
    function getMessage() public view returns (string memory) {
        return message;
    }
    
    function setMessage(string calldata newMessage) public onlyOwner {
        // Menggunakan calldata daripada memory untuk parameter
        // karena hanya read-only dan lebih hemat gas
        
        // Validasi input
        if (bytes(newMessage).length == 0) revert EmptyMessage();
        
        // Emit event sebelum perubahan
        emit MessageChanged(message, newMessage, msg.sender);
        
        message = newMessage;
    }
    
    // Pure function tidak membaca state, lebih hemat gas
    function getOwner() public view returns (address) {
        return owner;
    }
    
    // Menambahkan fungsi untuk mengecek panjang pesan
    function getMessageLength() public view returns (uint) {
        return bytes(message).length;
    }
}