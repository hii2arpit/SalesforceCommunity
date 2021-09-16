({
    doInit : function(component, event, helper) 
    {
        component.set("v.Columns",
        [
            {
                label:'Opportunity Name', 
                fieldName: 'OppName', 
                type: 'url',
                typeAttributes:{label:{fieldName:'Name'},target:'_blank'}
            },
            {
                label:'Amount',
                fieldName: 'Amount', 
                type:'Currency'
            },
            {   
                label:'CloseDate', 
                fieldName: 'CloseDate', 
                type:'date'
                // typeAttributes:{day:'2-digit',month:'long',year:'numeric'}
            },
            {   label:'Probability', 
                fieldName: 'Probability', 
                type:'Percent'
            },
            {
                label:'Stage', 
                fieldName: 'StageName', 
                type:'Picklist'
                
            }
        ]);

         //This is for picklist values
        var action = component.get("c.getStagePicklistValue");
        var OppSatge = component.find("oppStageform");
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
            OppSatge.set("v.options", opts);
        });
        $A.enqueueAction(action);

        helper.getData(component, event, helper);
    },

    toggleForm : function(component, event, helper)
    {
        var evtSource = event.getSource();
        if(evtSource.get("v.iconName") === 'utility:chevrondown')
        {
            evtSource.set("v.iconName", 'utility:chevronright');
        }else{
            evtSource.set("v.iconName", 'utility:chevrondown');
        }
        $A.util.toggleClass(component.find("fromDiv"),'slds-hide');
    },

    SaveData: function(component, event, helper)
    {
        var OppRecord  = component.get("v.Opportunities");
        var action = component.get("c.saveOpp");
        action.setParams({
            opp : OppRecord
        });

        action.setCallback(this, function(response)
        {
            var state = response.getState();
            if(state === 'SUCCESS')
            {
                console.log('Repomnse after saving..........> '+response.getReturnValue());
                var toastEvt = $A.get("e.force:showToast");
                if(response.getReturnValue() == null)
                {
                    toastEvt.setParams({
                        "type" : "Success",
                        "title" : "Success",
                        "Message" : "New Opportunity is created",
                        "mode": "dismissible"
                    });
                }else{
                    toastEvt.setParams({
                        "type" : "Error",
                        "title" : "Error",
                        "Message" : response.getReturnValue(),
                        "mode": "sticky"
                    });
                }
                toastEvt.fire();
                $A.get("e.force:refreshView").fire();
            }else{
                console.log("Error during saving the record! "+state);
            }
        });
        $A.enqueueAction(action);
    }
})