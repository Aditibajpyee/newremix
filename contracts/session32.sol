// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SLParticipants {

    struct Participant{

        string Pname;

        uint Page;

        uint Pphoneno;

        string Pemail;

        string courseenrolled;

        bool feepaid;

}

//mapping(key=>value) mappingname

mapping(uint=>Participant) SParticipants;//Sparticipants is a Object

 

function addParticipant(uint key,string memory _name,uint _age,uint _phoneno, string memory _email, string memory _courseenrolled, bool _feepaid) public

{

    SParticipants[key]=Participant(_name,_age,_phoneno,_email,_courseenrolled,_feepaid);

}

function getParticipant(uint key) public view returns (Participant memory)

{

    return(SParticipants[key]);

}

}