const cds = require('@sap/cds');
class EmployeeModelService extends cds.ApplicationService {
    init() {
        const { LeaveRequest } = this.entities;

        this.before('UPDATE', LeaveRequest.drafts, async (req) => {
            if (req.data?.startDate || req.data?.endDate) {
                let startDate = req.data?.startDate;
                let endDate = req.data?.endDate;

                let oLeaveRequestData = await cds.run(SELECT.one.from(LeaveRequest.drafts).where({
                    ID: req.data.ID
                }));

                startDate = startDate ? new Date(startDate) : new Date(oLeaveRequestData.startDate);
                endDate = endDate ? new Date(endDate) : new Date(oLeaveRequestData.endDate);

                if (startDate && startDate < new Date()) {
                    req.reject({
                        status: 400,
                        code: 'MISSING_INPUT',
                        message: 'Past dates are not allowed',
                        target: 'startDate',
                    });
                }

                if (endDate && endDate < new Date()) {
                    req.reject({
                        status: 400,
                        code: 'MISSING_INPUT',
                        message: 'Past dates are not allowed',
                        target: 'startDate',
                    });
                }

                let days = calculateTotalDays(startDate, endDate);
                return req.data.noOfDays = days;
            }
        });


        function calculateTotalDays(startDate, endDate) {
            // Convert to Date objects
            //const start = new Date(startDate);
            // const end = new Date(endDate);

            const start = startDate;
            const end = endDate;

            // Calculate difference in milliseconds
            const diffInMs = end - start;

            // Convert milliseconds to days
            const diffInDays = diffInMs / (1000 * 60 * 60 * 24);

            // Add 1 if you want to include both start & end dates
            return diffInDays + 1;
        }

        return super.init();
    }
}

module.exports = EmployeeModelService;