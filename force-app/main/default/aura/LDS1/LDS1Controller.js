({
    doInit : function(component, event, helper)
    {
        component.find("newAccountRecord").getNewRecord(
            "Account",
            null,
            "True",
            $A.getCallback(function(){
                var recrd = component.get("v.Accountrecord");
                var error = component.get("v.newAccountError");

                if(error || (recrd == null ))
                {
                    comsole.log("Error here......: "+error);
                }
                else{
                    console.log("New Account Record-------: "+ recrd.apiName);
                }
            })
        );

            //This is for picklist values
        var action = component.get("c.getPicklistValue");
        var accountIndustry = component.find("accountIndustryField");
        var opts = [];
        action.setCallback(this, function(response){
            opts.push({
                class: "OptionClass",
                label: "--none--",
                value:""
            });

            for(var i=0; i<response.getReturnValue().length;i++)
            {
                opts.push({"class": "OptionsClass", label:response.getReturnValue()[i], value: response.getReturnValue()[i]});
            }
            accountIndustry.set("v.options", opts);
        });
        $A.enqueueAction(action);
    },

    saveAccount : function(component, event, helper) 
    {
        component.find("newAccountRecord").saveRecord(function(saveResult){
            if(saveResult.state === 'SUCCESS' || saveResult.state === 'DRAFT')
            {
                
                console.log("Complete.............. "+ JSON.stringify(saveResult));
                var toastMsg = $A.get("e.force:showToast");
                toastMsg.setParams({   
                    "title":"Success!",
                    "message":"The account record has been saved."
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
                    "message":"The account record has not been saved."
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

    //This method is for displaying selected picklist value
    onSelectChange : function(component, event, helper)
    {
        var selectedPicklist = component.find("accountIndustryField");
        alert(selectedPicklist.get("v.value"));
    }
})