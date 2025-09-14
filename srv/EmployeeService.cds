using {leave.request.app as model} from '../db/data-model';

using {CustomerS4API as externalservice} from './external/CustomerS4API';

service EmployeeModelService {
    entity Employees        as projection on model.Employees;
    entity Departments      as projection on model.Departments;
    entity Designations     as projection on model.Designations;
    entity Status           as projection on model.Status;
    entity FamilyMembers    as projection on model.FamilyMembers;
    entity Attendance       as projection on model.Attendance;
    entity AttendanceStatus as projection on model.Attendance;


    entity LeaveRequest @(restrict: [
        {
            grant: ['READ'],
            to   : ['LeaveAppManager']
        },
        {
            grant: [
                'READ',
                'WRITE'
            ],
            to   : ['LeaveAppEmployee']
        }
    ])                      as projection on model.LeaveRequests;

    entity LeaveTypes       as projection on model.LeaveTypes;
    entity LeaveStatus      as projection on model.LeaveStatus;

    action submitLeaveRequest @(restrict: [{
        grant: ['*'],
        to   : ['LeaveAppEmployee']
    }])(leaveRequestID: String) returns String;

    entity CustomerSet      as projection on externalservice.CustomerSet;

}

annotate EmployeeModelService.LeaveRequest with {

}
