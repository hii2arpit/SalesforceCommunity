({
    createContact : function(component, event, helper) 
    {
        var action = component.get("c.getRecordTypeId");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS')
            {
                var contactRecord = $A.get("e.force:createRecord");
                var recTypeId = response.getReturnValue();
                if(contactRecord)
                {
                    contactRecord.setParams({
                        "entityApiName":"Contact",
                        "recordTypeId" : recTypeId
                    });
                    contactRecord.fire();
                }        
            }

        });
        $A.enqueueAction(action);
    },

    goToURL : function(component, event, helper)
    {
        var add = component.get("v.address");
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
          "url": 'https://www.google.com/maps/place/' + add
        });
        urlEvent.fire();
    },

    listViewNavigate : function(component, event, helper)
    {
        var action = component.get("c.getListViews");
        action.setCallback(this, function(response){
        var state = response.getState();
        if (state === "SUCCESS") {
            var listviews = response.getReturnValue();
            var navEvent = $A.get("e.force:navigateToList");
            navEvent.setParams({
                "listViewId": listviews.Id,
                "listViewName": null,
                "scope": "Contact"
            });
            navEvent.fire();
        }
    });
    $A.enqueueAction(action);
    }
})