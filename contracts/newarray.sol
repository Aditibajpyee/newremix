// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;
contract Test{//name of contract
    struct Book{
        string Title;
        string author;
        uint book_id;
        string publisher;
    }
    Book book;//taking object of structure book
    function setBook() public{
        book =Book("Learn solidity","Dr Ishu",101,"emerald");
    }
    function getBooktitle() public view returns(string memory _Title){
        return book.Title;
    }
    function getBookid() public view returns(uint){
        return book.book_id;
    }
    /*string ins_name;
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
}*/
}
