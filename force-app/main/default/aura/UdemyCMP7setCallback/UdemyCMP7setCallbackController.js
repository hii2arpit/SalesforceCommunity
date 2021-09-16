({
    doInvoke : function(component, event, helper) 
    {
        var action = component.get("c.name");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESS")
            {
                var result = response.getReturnValue();
                component.set("v.myName", result);
            }
        });
        $A.enqueueAction(action);

    }
})