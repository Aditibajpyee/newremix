// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Test{
    address public addblock;
    function setAddress(address _addblock) public{
        addblock=_addblock;
    }
    function getBalanceofAccount() public view returns(uint){
        return addblock.balance;
    }
}