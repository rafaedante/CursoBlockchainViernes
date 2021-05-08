pragma solidity ^0.5.0;

contract Cv_Clase3_Ej2 {
    
    struct Book {
        string name;
        string writter;
        uint id;
        bool available;
    }
    
    Book book1;
    
    Book book2 = Book("Building Ethereum DApps", "RDI", 2, false);
    
    constructor () public {}
    
    function set_book_detail() public {
        
        book1 = Book("Introducing Ethereum", "other", 1, true);
    }
    
    function get_name_book1() public view returns(string memory) {
        return book1.name;
    }
    
    function get_info_book2() public view returns(string memory, string memory, uint, bool) {
        return (book2.name, book2.writter, book2.id, book2.available);
    }
}