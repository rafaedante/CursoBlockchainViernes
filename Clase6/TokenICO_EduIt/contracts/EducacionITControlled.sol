pragma solidity ^0.5.0;

contract EducacionITControlled {

    address controller;

    constructor() public {
      controller = msg.sender;
    }

    function changeController(address _newController) onlyController public {
      controller = _newController;
    }

    modifier onlyController() {
      require(msg.sender == controller);
      _;
    }

}
