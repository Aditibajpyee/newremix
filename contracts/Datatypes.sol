// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Practice{
    uint8 a=1;
    int b=1231;
    uint c=45;
    bool d=true;
    bytes1 b1=0x45;
    bytes b2;
    string greet="test";
    enum status{
        Pending,Pocessed,Rejected,Accepted,Shipped
    }
    struct patient{
        string name;
        string age;
        uint16 gender;
        bool interest;

    }
    address myaddress=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

}