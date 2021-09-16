({
    showData : function(component, event, helper) 
    {
        var column = [
            {label: 'Account Name', fieldName:'accName', type:'text'},
            {label:'Account Phone', fieldName:'accPhone', type:'text'},
            {lable: 'Account Industry', fieldName:'accIndustry', type:'text'}
        ];
        component.set("v.columns",column);

        var action = component.get("c.getAcc");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESS")
            {
                var result = response.getReturnValue();
                console.log(JSON.stringify(result));
                component.set("v.lstAccounts", result);
                component.set("v.flag", true);
            }
        });
        $A.enqueueAction(action);

    }
})