({
    doSave : function(component, event, helper) {
        console.log("inside Do save Parent")
        var accountinsert = component.get("v.acc");
        console.log('Check entered Data------>'+JSON.stringify(accountinsert));
        var action = component.get("c.saveAccountUsingEvent");
        action.setParams({"acnt": accountinsert});
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log("Check the state of the save result-----"+state);
            if(state === 'SUCCESS')
            {
                var result = response.getReturnValue();
                console.log('Entered Data before checking error-------'+ JSON.stringify(result));
                if(result != 'Error')
                {
                    console.log('Entered Data-------'+ JSON.stringify(result));
                    var evnt = component.getEvent("first");
                    console.log('Checkl the event value------'+evnt);
                    evnt.setParams({"acc":accountinsert});
                    evnt.fire();
                }
            }
        });
        $A.enqueueAction(action);
    },

    doCancel : function(component,event,helper)
    {
        console.log("Inside cancel");
        component.set("v.acc", null);
    }
})