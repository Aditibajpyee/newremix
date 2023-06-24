// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MigrantWorkerDapp {
    struct Applicant {
        uint id;
        string name;
        string laborHistory;
        string skills;
        bool isRegistered;
    }
    
    struct Job {
        uint id;
        string title;
        string description;
        uint salary;
        address provider;
        bool isAvailable;
    }
    
    struct Rating {
        uint ratingValue;
        uint totalRatings;
    }
    
    mapping(uint => Applicant) public applicants;
    mapping(uint => Job) public jobs;
    mapping(uint => Rating) public applicantRatings;
    
    uint public applicantCount;
    uint public jobCount;
    
    event NewApplicantAdded(uint id, string name);
    event NewJobAdded(uint id, string title);
    event ApplicantApplied(uint applicantId, uint jobId);
    event RatingProvided(uint applicantId, uint ratingValue);
    
    // Add a new applicant
    function addNewApplicant(string memory _name, string memory _laborHistory, string memory _skills) public {
        applicantCount++;
        applicants[applicantCount] = Applicant(applicantCount, _name, _laborHistory, _skills, true);
        emit NewApplicantAdded(applicantCount, _name);
    }
    
    // Get applicant details
    function getApplicantDetails(uint _applicantId) public view returns (string memory, string memory, string memory) {
        require(applicants[_applicantId].isRegistered, "Applicant does not exist.");
        return (applicants[_applicantId].name, applicants[_applicantId].laborHistory, applicants[_applicantId].skills);
    }
    
    // Get applicant type
    function getApplicantType(uint _applicantId) public view returns (string memory) {
        require(applicants[_applicantId].isRegistered, "Applicant does not exist.");
        if (bytes(applicants[_applicantId].laborHistory).length > 0) {
            return "Experienced";
        } else {
            return "Newbie";
        }
    }
    
    // Add a new job to the portal
    function addNewJob(string memory _title, string memory _description, uint _salary) public {
        jobCount++;
        jobs[jobCount] = Job(jobCount, _title, _description, _salary, msg.sender, true);
        emit NewJobAdded(jobCount, _title);
    }
    
    // Get job details
    function getJobDetails(uint _jobId) public view returns (string memory, string memory, uint, address) {
        require(jobs[_jobId].isAvailable, "Job does not exist or is not available.");
        return (jobs[_jobId].title, jobs[_jobId].description, jobs[_jobId].salary, jobs[_jobId].provider);
    }
    
    // Applicants apply for a job
    function applyForJob(uint _applicantId, uint _jobId) public {
        require(applicants[_applicantId].isRegistered, "Applicant does not exist.");
        require(jobs[_jobId].isAvailable, "Job does not exist or is not available.");
        emit ApplicantApplied(_applicantId, _jobId);
    }
    
    // Provide a rating to an applicant
    function provideRating(uint _applicantId, uint _ratingValue) public {
        require(applicants[_applicantId].isRegistered, "Applicant does not exist.");
        require(_ratingValue >= 0 && _ratingValue <= 5, "Rating value must be between 0 and 5.");
        applicantRatings[_applicantId].ratingValue += _ratingValue;
        applicantRatings[_applicantId].totalRatings++;
        emit RatingProvided(_applicantId, _ratingValue);
    }
    
    // Fetch applicant rating
    function fetchApplicantRating(uint _applicantId) public view returns (uint, uint) {
        require(applicants[_applicantId].isRegistered, "Applicant does not exist.");
        return (applicantRatings[_applicantId].ratingValue, applicantRatings[_applicantId].totalRatings);
    }
}
