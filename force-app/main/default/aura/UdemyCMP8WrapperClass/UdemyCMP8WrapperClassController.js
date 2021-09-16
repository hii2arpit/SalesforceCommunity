({
    searchData : function(component, event, helper) 
    {
        var key = component.get("v.strKey");
        alert(key);
        var action = component.get("c.searchAccount");
        action.setParams({"strIndustry":key});
        action.setCallback(this, function(response){
            var state = response.getState();
                if(state == "SUCCESS")
                {
                    var result = response.getReturnValue();
                    component.set("v.accountRecord", result);
                    component.set("v.flag", true);
                }
                else{
                    var result = response.getReturnValue();
                    alert(result.status);
                }
        });
        $A.enqueueAction(action);
    }
})