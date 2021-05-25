pragma solidity ^0.4.22;

contract Reentrada {
    
    address owner;
    mapping(address=> uint256) balance;
    mapping(address=>uint256) pagosRealizados;
    
    private mapping(address => string) clavesDeLosusuarios;
    
    uint256 variable1;
    uint256 variable2;
    uint256 variable3;
    
    constructor() public {
        owner = msg.sender;
        variable1 = 5;
        variable2 = 10;
        variable3 = 30;
    }
    
    function retirarFondosTotales() public payable {
        
        require(balance[msg.sender] > 0);
        require(msg.gasleft) >= cantidaddegasquesenecesitaparaefecturarlaoperacion;
         
        variable3 = variable2;          // consume x unidades de gas -- 1er operacion (10)
        variable2 = variable1           // consume x unidades de gas -- 2da operacion (10)
        variable1 = variable2 + variable3; // consume x unidades de gas -- 3ra operacion (10)
        
        retirarFondos();  // consume x unidades de gas -- 4ta operacion (10)
        
       // balance[msg.sender] = 0;
        pagosRealizados[msg.sender] = 0;
        
    }
    
    function retirarFondos() private {
        
        // transfer()
    }
    
}