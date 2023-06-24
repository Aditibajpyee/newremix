// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Dapp {
    struct Applicant {
        uint id;
        string name;
        string skills;
        string experience;
        bool registered;
    }

    struct Job {
        uint id;
        string title;
        string skillsrequired;
        uint salary;
        address provider;
        bool available;
    }

    struct Rating {
        uint rating;
        uint overallrating;
    }

    mapping(uint => Applicant) public applicants;
    mapping(uint => Job) public jobs;
    mapping(uint => Rating) public ratings;

    uint public acount;
    uint public jcount;

    event NewApplicant(uint id, string name);
    event NewJob(uint id, string title);
    event Ratingstated(uint aid, uint rating);

    function addNewApplicant(
        string memory _name,
        string memory _experience,
        string memory _skills
    ) public {
        acount++;
        applicants[acount] = Applicant(acount, _name, _skills, _experience, true);
        emit NewApplicant(acount, _name);
    }

    function getApplicantValues(uint _aid) public view returns (string memory, string memory, string memory) {
        require(applicants[_aid].registered, "Not valid");
        return (
            applicants[_aid].name,
            applicants[_aid].experience,
            applicants[_aid].skills
        );
    }

    function getApplicantType(uint _aid) public view returns (string memory) {
        require(applicants[_aid].registered, "Invalid");
        if (bytes(applicants[_aid].experience).length > 1) {
            return "Experienced";
        } else {
            return "Unskilled";
        }
    }

    function addNewJob(
        string memory _title,
        string memory _skillsrequired,
        uint _salary
    ) public {
        jcount++;
        jobs[jcount] = Job(jcount, _title, _skillsrequired, _salary,msg.sender, true);
        emit NewJob(jcount, _title);
    }

    function getJobDetails(uint _jid) public view returns (string memory, string memory, uint,address) {
        require(jobs[_jid].available, "Job does not exist");
        return (
            jobs[_jid].title,
            jobs[_jid].skillsrequired,
            jobs[_jid].salary,
            jobs[_jid].provider
        );
    }

    function giveRating(uint _aid, uint _rating) public {
        require(applicants[_aid].registered, "Applicant does not exist.");
        require(_rating >= 0 && _rating <= 5, "Rating value must be between 0 and 5.");
        ratings[_aid].rating += _rating;
        ratings[_aid].overallrating++;
        emit Ratingstated(_aid, _rating);
    }

    function fetchApplicantRating(uint _aid) public view returns (uint, uint) {
        require(applicants[_aid].registered, "Applicant does not exist.");
        return (ratings[_aid].rating, ratings[_aid].overallrating);
    }
}
