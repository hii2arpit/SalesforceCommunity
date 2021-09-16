({
    doInit : function(component, event, helper)
     {
        var recordkey = component.get("v.currentRecord");
        console.log('record id.............'+recordkey);
        var loc= component.get("c.getBillingLocation");
        loc.setParams({"currentrecordid": recordkey});
        loc.setCallback(this, function(response)
        {
            console.log("test......"+response);
            var state = response.getState();
            console.log("state testing......"+state);
            if(state === 'SUCCESS')
            {
                var result = response.getReturnValue();
                console.log("Print result------------"+ JSON.stringify(result));
                component.set("v.mapMarkers", result);
                component.set("v.zoomLevel", 4);
                component.set("v.markersTitle", "Contacts Location");
                component.set("v.showFooter", true);
            }
        });
        $A.enqueueAction(loc);
    }
})