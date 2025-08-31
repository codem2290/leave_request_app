sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.leave.app.leaverequestuiapp',
            componentId: 'LeaveRequestList',
            contextPath: '/LeaveRequest'
        },
        CustomPageDefinitions
    );
});