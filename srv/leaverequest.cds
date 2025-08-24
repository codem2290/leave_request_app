using {leave.request.app as model} from '../db/data-model';

service LeaveRequestService {
    entity Employees    as projection on model.Employees;
    entity Departments  as projection on model.Departments;
    entity Designations as projection on model.Designations;
    entity Status       as projection on model.Status;
}
