namespace leave.request.app;

using {
    cuid,
    managed
} from '@sap/cds/common';

// Transaction table
entity Employees : cuid, managed {
    firstName     : String(30);
    lastName      : String(30);
    email         : String(50);
    mobile        : String(12);
    address       : String(255);
    department    : Association to Departments; // managed association
    designation   : Association to Designations;
    joiningDate   : Date;
    status        : Association to Status;
    familyMembers : Composition of many FamilyMembers
                        on familyMembers.employee = $self;
}

//Master Table
entity Departments {
    key code : String(3);
        name : String(50);
}


entity FamilyMembers : cuid, managed {
    firstName    : String(30);
    lastName     : String(30);
    email        : String(50);
    mobile       : String(12);
    address      : String(255);
    relationship : String;
    employee     : Association to Employees;
}

//Master Table
entity Designations {
    key code : String(3);
        name : String(50);
}

entity Status {
    key code : String(3);
        name : String(50);
}
