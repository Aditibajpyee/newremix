// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Test{
    //key-value relationship
    mapping (address=>uint256) private favnumber;
    //first function reading the data
    function getmyfavnumber() external view returns(uint256){
       return favnumber[msg.sender]; 
    }
    //2nd function writing the data
    function setmyfavnumber(uint256 num) external  
        {
            require(num!=13,"change the number");
            favnumber[msg.sender]=num;
        }
}