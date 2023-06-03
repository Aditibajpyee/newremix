// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;
contract Test{
    string ins_name;
    string[] name;
    bool registered;
    uint[] age;
    function setInsDetails(string memory _ins_name,bool _registered)public{
        ins_name=_ins_name;
        registered=_registered;
    }
    function setStudentDetails(string memory _name,uint _age)public{
            name.push(_name);
            age.push(_age);
    }
function getStudentDetails(uint _index) public view returns(string memory,uint){
    return(name[_index],age[_index]);
}
}
//3.32