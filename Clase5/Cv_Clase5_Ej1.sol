pragma solidity ^0.4.22;

contract Ejemplo_UO {
    
    address owner;
    mapping(address => uint8) balancesEnToken;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function comprarToken(uint8 cantidad) public payable {
        balancesEnToken[msg.sender] = balancesEnToken[msg.sender] + cantidad;
    }
    
    function ObtenerCantidadTokensPorUser() public view returns (uint8) {
        return balancesEnToken[msg.sender];
    }
    
    function RestarToken(uint8 cantidad) public {
        balancesEnToken[msg.sender] = balancesEnToken[msg.sender] - cantidad;
    }
    
}