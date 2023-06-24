pragma solidity ^ 0.4.20;

contract structSample{
    
    struct student{
        string name;
        uint age;
        uint id;
    }
    
    //create instance
    student _student;
    
    function setStudentValues(string memory _name, uint _age, uint _id) public{
        _student.name=_name;
        _student.age=_age;
        _student.id=_id;
    }
    
    function getStudentValues() public view returns(string memory, uint, uint){
        return (_student.name, _student.age, _student.id);
        
    }
    
}
