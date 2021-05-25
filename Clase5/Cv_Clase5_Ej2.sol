pragma solidity >0.4.10;

contract Ejemplo1 {
    
    struct Account {
        string addr;
        uint amount;
    }
    
    uint counter = 1;
    
    mapping(uint => Account) accounts;
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function create(string memory addr) public {
        accounts[counter++] = Account(addr, 45);
        owner = msg.sender;
    }
    
    function getAddress(uint nr) public view returns (string memory) {
        return accounts[nr].addr;
    }
    
      function getAmount(uint nr) public view returns (uint) {
        return accounts[nr].amount;
    }
    
    function set(uint nr, string memory addr) public returns (bool) {
        if(owner == msg.sender) {
             accounts[counter++] = Account(addr, nr);
             return true;
        } else {
            return false;
        }
    }
    
}