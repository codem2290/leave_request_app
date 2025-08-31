sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/leave/app/leaverequestuiapp/test/integration/FirstJourney',
		'com/leave/app/leaverequestuiapp/test/integration/pages/LeaveRequestList',
		'com/leave/app/leaverequestuiapp/test/integration/pages/LeaveRequestObjectPage'
    ],
    function(JourneyRunner, opaJourney, LeaveRequestList, LeaveRequestObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/leave/app/leaverequestuiapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheLeaveRequestList: LeaveRequestList,
					onTheLeaveRequestObjectPage: LeaveRequestObjectPage
                }
            },
            opaJourney.run
        );
    }
);