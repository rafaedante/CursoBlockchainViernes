pragma solidity ^0.4.22;

contract Cv_Clase4_Ej2 {
    
    address owner;
    address[] public apostadores;
    address[] private listaEspecial;
    
    constructor() public {
        owner = msg.sender;
        listaEspecial.push(owner);
    }
    
    function apostar() public payable {
        require(msg.value >= 1 ether);
        apostadores.push(msg.sender);
        
      
    }
    
    function obtenerListaApostadores() public view returns (address[]) {
        return apostadores;
    }
    
    function apuestaEspecial() public payable {
        require(msg.value >= 5 ether);
        require(msg.sender != owner);
        listaEspecial.push(msg.sender);
    }
    
    function obtenerListaEspecial() public view returns (address[]) {
        require(msg.sender==owner);
        return listaEspecial;
    }
    
}