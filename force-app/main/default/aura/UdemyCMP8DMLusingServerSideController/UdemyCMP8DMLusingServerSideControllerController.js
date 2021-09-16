({
    saveData : function(component, event, helper)
    {
        var account = component.get("v.accountRecord");
        var action = component.get("c.createAccount");
        console.log(JSON.stringify(account));
        
        action.setParams({"acc":account});
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log(state);
            
            if(state == "SUCCESS")
            {
                var result = response.getReturnValue();
                alert(result);
            }
        });
        $A.enqueueAction(action);
    },
    cancelData : function(component, event, helper)
    {
        component.set("v.accountRecord", null);
    }
})