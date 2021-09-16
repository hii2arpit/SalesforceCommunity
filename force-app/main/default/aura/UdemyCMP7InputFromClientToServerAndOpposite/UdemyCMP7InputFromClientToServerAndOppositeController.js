({
    doSearch : function(component, event, helper) 
    {
        var action = component.get("c.getAccount");
        action.setParams({"strIndustry":component.get("v.strKey")});

        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESS")
            {
                var result = response.getReturnValue();
                component.set("v.accRecord", result);
                component.set("v.flag", true);
            }
        });
        $A.enqueueAction(action);

    }
})