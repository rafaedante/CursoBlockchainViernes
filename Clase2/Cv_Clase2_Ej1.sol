pragma solidity ^0.4.17;
 
contract Cv_Clase2_Ej1 {
 
    string public mi_mensaje;
    string public mensaje2;
 
    function Cv_Clase2_Ej1 (string pMensaje,string pMensaje2) public {
        mi_mensaje = pMensaje;
        mensaje2 = pMensaje2;
    }
 
    function obtenerMiMensaje () public view returns(string) {
        return mi_mensaje;   
    }
 
     function obtenerMiSegundoMensaje () public view returns(string) {
        return mensaje2;   
    }
 
    function obtenerExpresion() public pure returns (string){
        return "esta es una expresión desde mi contrato";
    }
     function obtenerExpresionClaseBlockChain() public pure returns (string){
        return "Estoy en clase de blockchain";
    }
}