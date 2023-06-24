//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Money{

    //Third Account I am considering here

    address ishu=0x617F2E2fD72FD9D5503197092aC168c91465E7f2;

    function getMoney() public payable {} // Temporary Work

    function transferMoney() public{

        payable(ishu).transfer(address(this).balance);

    }

}
2:11:03..3