pragma solidity ^0.5.0;
 
contract Clase3_Ej3_2 {
 
    struct Persona {
        string nombre;
        string apellido;
        uint edad;
    }
 
    Persona persona;
 
    constructor(string memory pNombre , string memory pApellido , uint pEdad) public {
        persona.nombre = pNombre;
        persona.apellido = pApellido;
        persona.edad = pEdad;
    }
 
    function edad() public view returns (uint) {
        return persona.edad;
    }
}