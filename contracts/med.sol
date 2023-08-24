// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MedicalRecords {
    struct Doctor {
        uint id;
        string name;
        string qualification;
        string workPlace;
    }

    struct Patient {
        uint id;
        string name;
        uint age;
        string[] diseases;
    }

    struct Medicine {
        uint id;
        string name;
        uint expiryDate;
        uint dose;
        uint price;
    }

    mapping(address => Doctor) public doctors;
    mapping(address => Patient) public patients;
    mapping(uint => Medicine) public medicines;
    mapping(address => uint[]) public patientMedicines;

    uint public doctorCount;
    uint public patientCount;
    uint public medicineCount;

    function registerDoctor(string memory _name, string memory _qualification, string memory _workPlace) public {
        doctors[msg.sender] = Doctor(doctorCount, _name, _qualification, _workPlace);
        doctorCount++;
    }

    function registerPatient(string memory _name, uint _age) public {
        patients[msg.sender] = Patient(patientCount, _name, _age, new string[](0));
        patientCount++;
    }
 function addMedicine(uint _id, string memory _name, uint _expiryDate, uint _dose, uint _price) public {
        medicines[_id] = Medicine(_id, _name, _expiryDate, _dose, _price);
        medicineCount++;
    }
    function addDisease(string memory _disease) public {
        patients[msg.sender].diseases.push(_disease);
    }

    

    function prescribeMedicine(uint _id, address _patient) public {
        patientMedicines[_patient].push(_id);
    }

    function updatePatientAge(uint _age) public {
        patients[msg.sender].age = _age;
    }

    function viewPatientData(address _patient) public view returns (uint, string memory, uint, string[] memory, uint[] memory) {
        return (
            patients[_patient].id,
            patients[_patient].name,
            patients[_patient].age,
            patients[_patient].diseases,
            patientMedicines[_patient]
        );
    }

    function viewMedicineDetails(uint _id) public view returns (string memory, uint, uint, uint) {
        Medicine memory medicine = medicines[_id];
        return (
            medicine.name,
            medicine.expiryDate,
            medicine.dose,
            medicine.price
        );
    }

    function viewDoctorDetails(address _doctor) public view returns (uint, string memory, string memory, string memory) {
        Doctor memory doctor = doctors[_doctor];
        return (
            doctor.id,
            doctor.name,
            doctor.qualification,
            doctor.workPlace
        );
    }
}
