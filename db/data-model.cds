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

entity LeaveRequests : cuid, managed {
    employee  : Association to Employees;
    leaveType : Association to LeaveTypes;
    startDate : Date        @title: '{i18n>startDate}' default $now;
    endDate   : Date        @title: '{i18n>endDate}' default $now;
    reason    : String(255) @title: '{i18n>reason}';
    status    : Association to LeaveStatus default 'PEN';
    noOfDays  : Integer;
    relationship: String;
}

entity LeaveTypes {
    key code : String(3);
        name : String(50);
}

entity LeaveStatus {
    key code : String(3);
        name : String(50);
        statusColor: Integer;
}

entity Attendance : cuid, managed {
    employee : Association to Employees;
    date     : Date;
    status   : Association to AttendanceStatus;
    remark   : String(255);
}

entity AttendanceStatus {
    key code : String(3);
        name : String(50);
}


entity Holidays {
    key code : String(3);
        name : String(50);
}
