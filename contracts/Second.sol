pragma solidity ^0.8.0;

contract Helloworld{
    string str;
    function sayHello() public pure  returns (string memory) {
        string memory greet="hello world.";
        return greet;
    }
}