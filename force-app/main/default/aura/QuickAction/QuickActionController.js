({
    doInit : function(component, event, helper)
    {
        component.find("editContactRecord").getNewRecord(
            "Contact",
            null,
            "True",
            $A.getCallback(function(){
                var recrd = component.get("v.contact");
                var error = component.get("v.recordError");

                if(error || (recrd == null ))
                {
                    console.log("Error here......: "+error);
                }
                else{
                    console.log("New Account Record-------: "+ recrd.apiName);
                }
            })
        );
    },

    doSave : function(component, event, helper) 
    {
        component.set("v.contactFields.AccountId", component.get("v.recordId"));
        component.find("editContactRecord").saveRecord(function(saveResult){
            if(saveResult.state === 'SUCCESS' || saveResult.state === 'DRAFT')
            {
                
                console.log("Complete.............. "+ JSON.stringify(saveResult));
                var toastMsg = $A.get("e.force:showToast");
                toastMsg.setParams({   
                    "title":"Success!",
                    "message":"The contact record has been saved."
                });
                toastMsg.fire();
                $A.get('e.force:refreshView').fire();
                // location.reload();
            }
            else if(saveResult.state == "INCOMPLETE")
            {
                console.log("Not Complete.............. "+ JSON.stringify(saveResult.error));
                var toastMsg = $A.get("e.force:showToast");
                toastMsg.setParams({
                    "title":"Not Complete!",
                    "message":"The contact record has not been saved."
                });
                toastMsg.fire();
            }
            else{
                console.log("Some other Error.............. "+ JSON.stringify(saveResult.error));
                var toastMsg = $A.get("e.force:showToast");
                toastMsg.setParams({
                    "title":"Wrong Data!",
                    "message":"There is something wrong with your record."
                });
                toastMsg.fire();
            }

        });
      
    },

    doCancel : function(component, helper, event)
    {
        $A.get("e.force:closeQuickAction").fire();
    }

})