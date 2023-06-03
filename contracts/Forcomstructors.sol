
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
/*contract Test{
    uint storeddata;//state variable
    constructor() public{ //initialization
    storeddata=20;
    }

function getResult() public pure returns(uint){
    uint a=10;//local variable
    uint b=20;
    uint result=a+b;
    return result;//accesing local variable
    //return storeddata;  
}




}*/
contract Test{
    enum PizzaSize{SMALL,MEDIUM,LARGE}
        PizzaSize choice;
        uint public age=10;
        PizzaSize constant defaultChoice=PizzaSize.SMALL;
    function setLarge() public{
        choice=PizzaSize.LARGE;
    }
    function getChoice() public view returns(PizzaSize){
        return choice;
    }
    function getDefaultChoice() public pure returns(uint){
        return uint(defaultChoice);
    }
}