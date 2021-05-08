pragma solidity ^0.4.22;

contract Cv_Clase3_Ej1 {
    
    string private mensaje;
    address owner;
    enum Proceso {Inicial, Comenzado, Interrumpido, Finalizado}
    
    Proceso private estadoProceso = Proceso.Inicial;
    
    constructor(string pMensajeInicial) public {
        mensaje = pMensajeInicial;
    }
    
    function ObtenerMensaje() public view returns (string) {
        return mensaje;
    }
    
    function ProcesoAComenzado() public {
        estadoProceso = Proceso.Comenzado;
    }
    
    function ProcesoAInterrumpido() public {
        estadoProceso = Proceso.Interrumpido;
    }
    
    function ProcesoAFinalizado() public {
        estadoProceso = Proceso.Finalizado;
    }
    
    function obtenerProcesoActual() public view returns (Proceso) {
        return estadoProceso;
    }
}