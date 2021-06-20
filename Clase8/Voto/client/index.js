import Web3 from 'web3';
import Votacion from '../build/contracts/Votacion.json';

let web3;
let votacion;

const initWeb3 = () => {
  return new Promise((resolve, reject) => {
    if(typeof window.ethereum !== 'undefined') {
      const web3 = new Web3(window.ethereum);
      window.ethereum.enable()
        .then(() => {
          resolve(
            new Web3(window.ethereum)
          );
        })
        .catch(e => {
          reject(e);
        });
      return;
    }
    if(typeof window.web3 !== 'undefined') {
      return resolve(
        new Web3(window.web3.currentProvider)
      );
    }
    resolve(new Web3('http://localhost:9545'));
  });
};

const initContract = () => {
  const deploymentKey = Object.keys(Votacion.networks)[0];
  return new web3.eth.Contract(
    Votacion.abi, 
    Votacion
      .networks[deploymentKey]
      .address
  );
};

const initApp = () => {
    const $create = document.getElementById('create');
    const $createResult = document.getElementById('create-result');
    const $votar = document.getElementById('votar');  
    const $mensaje = document.getElementById('mensaje');
  
  
    let accounts = [];

    web3.eth.getAccounts()
    .then(_accounts => {
      accounts = _accounts;
    });

    $create.addEventListener('submit', (e) => {
      e.preventDefault();
      console.log('dando de alta votante')
      const name = e.target.elements[0].value;
      votacion.methods.createCandidate(name).send({from: accounts[0]})
      .then(result => {
        $createResult.innerHTML = `Candidato ${name} creado exitosamente`;
      })
      .catch(_e => {
        $createResult.innerHTML = `Hubo un error en la creacion del nuevo candidato...`;
      });
    });  

    const ObtenerValorCelda = (c) => {
      console.log('obtengo celda: ', c);
      
      if(c == 1) {
        return 1;
      }
      if(c == 2) {
        return 3;
      }
      if(c == 3) {
        return 5;
      }
      if(c == 4) {
        return 7;
      }      
      
      return -1;
    };
 
    const obtenerVotos = (v) => {
      console.log('obteniendo votos')
      const celdaAux = ObtenerValorCelda(v); 
      const celda = document.getElementsByTagName("td")[celdaAux];
      votacion.methods
          .getVotoCandidato(v)
          .call()
          .then(result => {              
              celda.innerHTML = result;
          });
    };    

    $votar.addEventListener('submit', (e) => {
      e.preventDefault();
      console.log('actualizando votantes')
      const id = e.target.elements[0].value;    
      votacion.methods.updateVotos(id).send({from: accounts[0]})
      .then(result => {
        $mensaje.innerHTML = `Se actualizo los votos al candidato ${id}`;
        obtenerVotos(id);
      })
      .catch(_e => {
        $mensaje.innerHTML = `Error actualizando voto del candidato user ${id}`;
      });
    }); 

};

document.addEventListener('DOMContentLoaded', () => {
  initWeb3()
    .then(_web3 => {
      web3 = _web3;
      votacion = initContract();
      initApp(); 
    })
    .catch(e => console.log(e.message));
});