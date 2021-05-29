pragma solidity ^0.5.0;

import "./EducacionITController.sol";
import "./EducacionITToken.sol";
import "./EducacionITControlled.sol";

contract EducacionITICO is EducacionITController {

  uint256 constant public limit = 200 ether;
  uint256 constant public equivalence = 230;
  uint256 public totalCollected;

  EducacionITToken tokens;

  address happyOwner = 0x312dj4555590op9088888;

  constructor() {
    totalCollected = 0;
  }

  function initializeToken(address _token, address _destiny) onlyController{
    require(address(tokens) == 0x0);
    tokens = EducacionITToken(_token);
    require(tokens.totalSupply() == 0);
    require(tokens.controller() == address(this));
    happyOwner =  _destiny;
  }


  function realBuy(address _sender, uint256 _amount) public returns (bool) {
    uint256 tokensGenerated = _amount * equivalence;

    require(totalCollected + _amount <= limit);

    assert(tokens.generateTokens(_sender, tokensGenerated));
    happyOwner.transfer(_amount);

    totalCollected = totalCollected + _amount;

    return true;
  }

  function proxyPayment(address _dir) payable returns (bool) {
    return realBuy(_dir, msg.value);
  }

  function() payable {
    proxyPayment(msg.sender);
  }

}
