// usar 0.4.22

// 1- definir un array estactico de 5 elementos
// 2- definir 2 funciones para el mismo, uno para asignar un valor y el otro para
// leerlo y otra funcion para leer un elemento del array
// 3- definir 2 funciones para el array dinamico que asigne un valor y otro de 
// de lectura

pragma solidity ^0.4.22;

contract clase4_ej {
    uint[] public array_est = new uint[](5);
    uint[] public array_din;
    
    function retornarArrayEst() public view returns(uint[]){
        return array_est;
    }
    
     function retornarArrayDin() public view returns(uint[]){
        return array_din;
    }
    
    function asignarValoresArrayEst(uint _index, uint _valor) public {
        array_est[_index] = _valor;
    }
    
    function asignarValoresArrayDin(uint _valor) public {
        array_din.push( _valor);
    }
    
    function retornarArrayEstElemento(uint _index) public view returns (uint) {
        return array_est[_index];
    }
    
    function retornarArrayDinElemento(uint _index) public view returns (uint) {
        return array_din[_index];
    }
    
}
