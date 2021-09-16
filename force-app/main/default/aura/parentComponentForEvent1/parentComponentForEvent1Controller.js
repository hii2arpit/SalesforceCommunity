({
    parentCompEvnt : function(component, event, helper) {

        var msg = event.getParam("first");
        component.set("v.eventMessage", msg + 'Arpit');

    }
})