using EmployeeModelService as service from './EmployeeService';

annotate service.LeaveRequest with {
    startDate @title: '{i18n>startDate}';
    endDate   @title: '{i18n>endDate}';
    reason    @title: '{i18n>reason}';
}


//Enable Draft Feature and Create and Edit Button in Fiori Application
annotate service.LeaveRequest with @fiori.draft.enabled;
annotate service.LeaveRequest with @odata.draft.enabled;
