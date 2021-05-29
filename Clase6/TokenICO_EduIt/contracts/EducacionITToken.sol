pragma solidity ^0.5.0;
import "./EducacionITControlled.sol";
import "./EducacionITController.sol"

contract EducacionITToken is EducacionITControlled {

  event Transfer(address indexed _from, address indexed _to, uint256 _value );

  mapping(address => uint256) public balances; // balances de cuentas - token
  uint256 public totalSupply; // maxima cantidad de tokens

  constructor() public {
    controller = msg.sender;
  }

  function balanceOf(address _owner) constant returns (uint256 balance) {
     return balances[_owner];
  }

  function transfer(address _to, uint256 _value) returns (bool success) {
     return realTransfer(msg.sender, _to, _value);
  }

  function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
     return realTransfer( _from, _to, _value);
  }

  function realTransfer(address _from, address _to, uint256 _value) internal return (bool) {
      if(_value == 0) return true; // si el monto a transferir es 0. Lo damos como ok pero no hacemos nada

      require((_to!=0) && (_to!= address(this)));

      uint256 previousBalanceFrom = balanceOf(_from);
      //se valida quien envia los token tenga la cantidad suficiente
      if(previousBalanceFrom < _value) {
        return false;
      }
      balances[_from] = balances[_from] - _value;

      uint256 previousBalanceTo = balanceOf(_to);
      require(previousBalanceTo + _value > previousBalanceTo);
      balances[_to] = balances[_to] + _value;

      emit Transfer(_from, _to, _value);

      return true;
  }


  function generateTokens(address _owner, uint256 _amount) onlyController returns (bool) {
     uint256 currentTotalSupply = totalSupply;
     require(currentTotalSupply + _amount >= totalSupply); // evitamos overflow

     uint256 previousBalanceTo = balanceOf(_owner);
     require(previousBalanceTo + _amount > previousBalanceTo); // evitamos overflow

     totalSupply = currentTotalSupply + _amount;
     balances[_owner] = previousBalanceTo + _amount;

     emit Transfer(0, _owner, _amount);

     return true;

  }

  function() payable {

    EducacionITController contr = EducacionITController(controller);
    require(contr.proxyPayment.value(msg.value)(msg.sender));

  }

}
