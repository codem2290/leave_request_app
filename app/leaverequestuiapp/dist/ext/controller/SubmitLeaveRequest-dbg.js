sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    'use strict';

    return {
        submitLeaveRequest: function (oEvent) {
            var ID = oEvent.getObject().ID;
            var action = "submitLeaveRequest";
            var oParameters = {
                model: this.getModel(),
                parameterValues: [{
                    name: "leaveRequestID",
                    value: ID
                }],
                skipParameterDialog: true
            };
            this.editFlow.invokeAction(action, oParameters).then(function (response) {
                if (response) {
                    this._controller.getExtensionAPI().refresh();
                }
            }.bind(this));
        },
        hideShowButton: function (oEvent) {
            if (oEvent?.getObject().status.code === 'PEN' && oEvent?.getObject().IsActiveEntity === true) {
                return true;
            } else {
                return false;
            }
        }
    };
});
