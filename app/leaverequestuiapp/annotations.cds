using EmployeeModelService as service from '../../srv/EmployeeService';
annotate service.LeaveRequest with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : leaveType_code,
            Label : '{i18n>LeaveType}',
           
        },
        {
            $Type : 'UI.DataField',
            Value : reason,
            
        },
        {
            $Type : 'UI.DataField',
            Value : startDate,
            
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : '{i18n>Status}',
            
        },
        {
            $Type : 'UI.DataField',
            Value : endDate,
            
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>LeaveDetails}',
            ID : 'i18nLeaveDetails',
            Target : '@UI.FieldGroup#i18nLeaveDetails',
        },
    ],
    UI.FieldGroup #i18nLeaveDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : reason,
            },
            {
                $Type : 'UI.DataField',
                Value : startDate,
            },
            {
                $Type : 'UI.DataField',
                Value : endDate,
            },
            {
                $Type : 'UI.DataField',
                Value : noOfDays,
                Label : '{i18n>TotalDays}',
            },
        ],
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'name',
            Target : 'status/@UI.DataPoint#name',
        },
    ],
    UI.HeaderInfo: {
       TypeNamePlural: 'Leaves',
        TypeName : '',
    },
    UI.DataPoint #status_code : {
        $Type : 'UI.DataPointType',
        Value : status_code,
        Title : 'status_code',
    },
);

annotate service.LeaveRequest with {
    reason @UI.MultiLineText : true
};

annotate service.LeaveRequest with {
    status @Common.FieldControl : #ReadOnly
};

annotate service.Employees with @(
    UI.DataPoint #firstName : {
        $Type : 'UI.DataPointType',
        Value : firstName,
        Title : '{i18n>Name}',
    }
);

annotate service.LeaveStatus with {
    name @Common.FieldControl : #ReadOnly
};

annotate service.LeaveRequest with {
    noOfDays @Common.FieldControl : #ReadOnly
};

annotate service.LeaveRequest with @(Common.SideEffects #updateNoOfDays: {
    SourceProperties: ['endDate', 'startDate'],
    TargetProperties: ['noOfDays']
});

annotate service.LeaveStatus with @(
    UI.DataPoint #name : {
        $Type : 'UI.DataPointType',
        Value : name,
        Title : 'Status',
        Criticality : statusColor,
    }
);

