pragma solidity ^0.5.0;

contract test_arrays {
    
    function testArray() public pure {
        
        uint len = 8;
        
        //dynamic testArray
        uint[] memory a = new uint[](7);
        
        //bytes es igual a byte[]
        bytes memory b = new bytes(len);
        
        assert(a.length == 7);
        assert(b.length == len);
        
        a[6] = 8;
        
        //test
        assert(a[6] == 8);
        
        //elements array fixed
        uint[3] memory c = [uint(1),2,3];
        assert(c.length == 3);
        
    }
}