pragma solidity ^0.4.22;

// contratos herencia

contract Ejemplo_1 {
    uint private data;
    
    function sumar(uint a) private returns (uint) {
        return a + 1;
    }
    
    function compute(uint a, uint b) internal returns (uint) {
        return a * b;
    }
    
    function getData() public returns (uint) {
        return data;
    }
}

contract Ejemplo_2 {
    Ejemplo_1 e1 = new Ejemplo_1();
    uint local = e1.getData();
    
}

contract Ejemplo_3 is Ejemplo_1 {
    
    function miFuncion() returns (uint) {
        Ejemplo_1 e1 = new Ejemplo_1();
        uint val = 1;
       // val = e1.compute(3,5);
        return val;
    }
}
    
