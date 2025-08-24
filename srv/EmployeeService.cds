using {leave.request.app as model} from '../db/data-model';

service EmployeeModelService {
    entity Employees        as projection on model.Employees;
    entity Departments      as projection on model.Departments;
    entity Designations     as projection on model.Designations;
    entity Status           as projection on model.Status;
    entity FamilyMembers    as projection on model.FamilyMembers;
    entity Attendance       as projection on model.Attendance;
    entity AttendanceStatus as projection on model.Attendance;
}
