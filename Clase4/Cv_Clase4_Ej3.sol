pragma solidity ^0.4.22;

contract Cv_Clase4_Ej3 {
    
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function MiFuncionEspecial(string _msj) public payable onlyOwner onlyWithEther returns (string, string) {
        return ("Esta es mi funcion especial", _msj);
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    modifier onlyWithEther() {
        require(msg.value >= 0.002 ether);
        _;
    }
    
    function semiRandom() public view returns (uint) {
        return uint(keccak256(block.difficulty, now, block.number));
    }
    
}