({
    doInit : function(component, event, helper) 
    {
        var accCol = [
            {lable:'Account Name', fieldName:'Name', type:'text'}, 
            {lable:'Account Phone', fieldName:'Phone', type:'text'},
            {lable:'Account Industry', fieldName:'Industry', type:'text'}
        ];

        component.set("v.accountColumns", accCol);

        var action = component.get("c.getAccounts");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESS")
            {
                var result = response.getReturnValue();
                component.set("v.lstAccounts", result);
            }
        });
        $A.enqueueAction(action);

        var contCol = [
            {label:'Contact LastName', fieldName:'LastName', type:'text'},
            {label:'Contact Email', fieldName:'Email', type:'text'}
        ];

        component.set("v.contactColumns", contCol);

        var action1 = component.get("c.getContacts");
        action1.setCallback(this, function(response1)
        {
            var state1 = response1.getState();
            if(state1 == "SUCCESS")
            {
                var result1 = response1.getReturnValue();
                component.set("v.lstContacts", result1);
            }
        });
        $A.enqueueAction(action1);
    }
})