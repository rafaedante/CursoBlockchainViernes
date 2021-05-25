pragma solidity ^0.4.22;

// contratos abstractos

contract OperacionAritmetica {
    function sumar() returns (uint256);
    function restar() returns (uint256);
}

contract Calculadora is OperacionAritmetica {
    function sumar() returns (uint256) { return 30 + 50;}
    
    function restar() returns (uint256) { return 80 - 50;}
}