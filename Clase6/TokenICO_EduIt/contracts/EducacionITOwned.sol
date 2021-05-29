pragma solidity ^0.5.0;

contract EducacionITOwned {
  address public owner;
  address public newOwner;

  constructor() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function changeOwner(address _newOwner) onlyOwner {
    newOwner = _newOwner;
  }

  // Recordar que uno de los patrones más utilizados es el
  // de aceptación por parte del usuario receptor (que invocaría a esta
  // función para aceptar sus tokens)
  function acceptOwnership() public {
    if (msg.sender == newOwner) {
      owner = newOwner;
    }
  }

}
