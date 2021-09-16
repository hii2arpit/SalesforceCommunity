({
    handleEvent : function(component, event, helper) 
    {
        var cmpEvent = component.getEvent("firstEvent");

        cmpEvent.setParams({
            "first" : "Welcome from Component..!"
        });

        cmpEvent.fire();

    }
})