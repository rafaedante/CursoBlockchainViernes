pragma solidity ^0.5.0;

contract Votacion {

    struct Candidato {
        uint id;
        string name;
        uint cantidad;
    }

    Candidato[] public candidatos;

    uint nextId = 1;

    function createCandidate(string memory name) public {
        candidatos.push(Candidato(nextId, name, 0));
        nextId++;
    }

    function getVotoCandidato(uint id) public returns(uint) {
        uint i = find(id);
        return candidatos[i].cantidad;
    }

    function updateVotos(uint id) public {
        uint i = find(id);
        candidatos[i].cantidad = candidatos[i].cantidad + 1;
    }

    function find(uint id) view internal returns (uint) {
        for(uint i=0; i < candidatos.length; i++) {
            if(candidatos[i].id == id) {
                return i;
            }
        }
        revert('Candidato no existe');
    }
}