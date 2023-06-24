// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Dapp{
    
    struct Applicant{
        string name;
        string skills;
        uint id;
        string experience;
        bool registered;
    }
   
    struct Job{
        string title;
        string skillsrequired;
        uint salary;
        bool available;
    }
    
    struct Rating{
    uint rating;
    uint overallrating;
    }
    mapping(uint =>Applicant) public applicants;
    mapping(uint =>Job) public job;
    mapping (uint =>Rating) public ratings;

    //create instance
    uint public acount;
    uint public jcount;
    event NewApplicant(uint id,string name);
    event NewJob(uint id,string title);
    event Ratingstated(uint aid,uint ratings);

    function addNewApplicant(string memory _name, string memory _experience, string memory _skills) public {
        acount++;
        applicants[acount] = Applicant(acount, _name, _experience, _skills, true);
        emit NewApplicant(acount, _name);
    }
    function getApplicantvalues(uint _aid) public  view returns(string memory,string memory,string memory){
        require(applicants[_aid].registered, "not valid");
        return (applicants[_aid].name,applicants[_aid].experience,applicants[_aid].skills);
    } 
    function getApplicantType(uint _aid) public view returns(string memory){
        require(applicants[_aid].registered, "Invalid");
        if(bytes(applicants[_aid].experience).length>0){
            return "Experienced";
        }
        else{
            return "Unskilled";
        }
   
    }
    function addNewJob(string memory _title, string memory _skillsrequired, uint _salary) public {
        jcount++;
        job[jcount] = Job(jcount, _title, _skillsrequired, _salary, true);
        emit NewJob(jcount, _title);
    }
     function getJobdetails(uint _jid) public view returns(string memory,string memory,uint){
            require(job[_jid].available,"job doesnot exist");
            return (job[_jid].title,job[_jid].skillsrequired,job[_jid].salary);
        }

    function givingRating(uint _aid,uint _rating) public{
        require(applicants[_aid].registered, "Applicant does not exist.");
        require(_rating>= 0 && _rating<= 5, "Rating value must be between 0 and 5.");
        ratings[_aid].rating += _rating;
        ratings[_aid].overallrating++;
        emit Ratingstated(_aid, _rating);
    }
    function fetchApplicantRating(uint _aid) public view returns (uint, uint) {
        require(applicants[_aid].registered, "Applicant does not exist.");
        return (ratings[_aid].rating, ratings[_aid].overallrating);
    }
}
