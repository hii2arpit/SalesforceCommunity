({
    showData : function(component, event, helper)
    {
        var cols = [
            {lable:'Account Name', fieldName: 'Name', type:'text'},
            {label:'Account Phone', fieldName: 'Phone', type:'text'},
            {lable:'Industry', fieldName: 'Industry', type:'text'}
        ];
        component.set("v.columns", cols);
        var action = component.get("c.getAccounts")
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