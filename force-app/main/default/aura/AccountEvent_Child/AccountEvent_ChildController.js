({
    searchAccount : function(component, event, helper) 
    {
        var searchkey1 = component.get("v.key");
        console.log("Entered industry value--->"+ searchkey1);
        var evt = component.getEvent("searchEvent");
        evt.setParams({"searchKey" : searchkey1});
        console.log('check the event----> '+ evt);
        evt.fire();
    }
})