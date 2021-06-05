var contractABI = [
    {
      "constant": true,
      "inputs": [],
      "name": "hello",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "payable": false,
      "stateMutability": "pure",
      "type": "function"
    },
    {
      "constant": true,
      "inputs": [],
      "name": "hello2",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "payable": false,
      "stateMutability": "pure",
      "type": "function"
    }
  ];

  var contractAddress = '0x98464E78017Ad0cdE2020581515Cf7A56477aa86';
  var web3 =  new Web3('http://localhost:9545');
  var helloWorld = new web3.eth.Contract(contractABI, contractAddress);
  console.log('recuperamos valores');

  document.addEventListener('DOMContentLoaded', () => {
    console.log('llamando a SC');
      helloWorld.methods.hello().call()
      .then(result => {
          document.getElementById('hello').innerHTML = result;
      });
  });