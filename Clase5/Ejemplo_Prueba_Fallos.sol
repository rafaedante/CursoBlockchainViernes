pragma solidity ^0.4.22;

contract PruebaFallos {
    
    address owner;
    enum Estados {Activo, Suspendido}
    
    Estados estadoActualDelContrato;
   
   
    constructor() public {
        owner = msg.sender;
       estadoActualDelContrato = Estados.Activo;
    }
    
    function BloquearContrato private {
        estadoActualDelContrato = Estados.Suspendido;
    }
    
    
    function ChequearEstado() onlyOwner public {
        // validar que la cantidad de ether en el contrato sea correcta
        // total de tokens < cantidad total
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
    }
    
    function otraFuncion() {
        require(estadoActualDelContrato == Estados.Activo);
        // resto del codigo
    }