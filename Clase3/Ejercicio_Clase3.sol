// Crear un contrato

// que tenga un struct llamada Persona que tenga nombre, apellido y edad

// crearla una variable de ese tipo e inciarla en el constructor

// definir un metodo que me devuelva la edad

pragma solidity ^0.5.0;
 
contract Ejercicio_Clase3{
    
    struct Persona{
        string nombre;
        string apellido;
        uint edad;
    }  
     Persona persona1; 
     
    constructor () public{
        persona1 = Persona('Juan','Perez',78);
    }
 
    function obtener_edad() public view returns(uint edad){
        return persona1.edad;
    }
 
}