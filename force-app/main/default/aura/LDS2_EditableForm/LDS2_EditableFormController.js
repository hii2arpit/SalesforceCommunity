({
    saveContact: function (component, event, helper) {
        console.log("Testing------------>");

        component.find("editRecord").saveRecord($A.getCallback(function (result) {
            if (result.state == "SUCCESS" || result.state == "DRAFT") {
                console.log("Save Completed Successfully");

            }
            else if (result.state == "INCOMPLETE") {
                console.log("There is something wrong, record is not complete.");
            }
            else if (result.state == "ERROR") {
                console.log("There is problem with the record");
            }
            else {
                console.log("There is some unknown problem.");
            }
        }));
    },
    deleteContact: function (component, event, helper) {
        // console.log("inside delete first.............");
        component.find("editRecord").deleteRecord($A.getCallback(function (response) {
            // console.log("inside delete.............");
            if (response.state === 'SUCCESS' || response.state === 'DRAFT') {
                console.log("Deleted Successfully!");
                var toastMsg = $A.get("e.force:showToast");
                toastMsg.setParams({
                    "title": "Success!",
                    "message": "The contact record has been deleted."
                });
                toastMsg.fire();
                // $A.get('e.force:refreshView').fire();
            }
            else if (response.state === 'INCOMPLETE') {
                console.log("There is something wrong, record is not complete.");
            }
            else if (response.state === 'ERROR') {
                console.log("There is problem with the record");
                alert("Problem deleting record, error:" +
                    JSON.stringify(response.error));
            }
            else {
                console.log("There is some unknown problem.");
            }

        }));
    }

    // updatedRecords : function(Component, event, helper)
    // {
    //     var eventParams = event.getParams();
    //     if(eventParams.changeType === "CHANGED") {
    //        // record is changed
    //     } else if(eventParams.changeType === "LOADED") {
    //         // record is loaded in the cache
    //     } else if(eventParams.changeType === "REMOVED") {
    //         // record is deleted, show a toast UI message
    //         var resultsToast = $A.get("e.force:showToast");
    //         resultsToast.setParams({
    //             "title": "Deleted",
    //             "message": "The record was deleted."
    //         });
    //         resultsToast.fire();

    //     } else if(eventParams.changeType === "ERROR") {
    //         // there’s an error while loading, saving, or deleting the record
    //     }

    // }
})