pragma solidity ^0.5.0;

contract SimpleStorage {
    uint storeData;

    function set(uint x) public {
        storeData = x;
    }

    function get() public view returns(uint) {
        return storeData;
    }

}