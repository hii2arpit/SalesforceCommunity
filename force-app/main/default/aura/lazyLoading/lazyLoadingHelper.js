({
    getAccountData : function(component)
    {
        var action = component.get("c.getAccountRecordsinLazyLoading");
        action.setParams({
            "initialRows" : component.get("v.initialRows")
        });
        action.setCallback(this, function(response)
        {
            var state = response.getState();
            var toastReference = $A.get("e.force:showToast");
            if(state === 'SUCCESS')
            {
                var accountData = response.getReturnValue();
                console.log('Account list..........>'+ JSON.stringify(accountData));
                if(accountData.success)
                {
                    console.log('Total Recordsasss------>'+ accountData.totalRecords);
                    component.set("v.totalRows", accountData.totalRecords);
                    var allaccount = accountData.accountlist;

                    console.log('Account list..........>'+ JSON.stringify(allaccount));

                    //Set the account name as URL using forEach Loop
                    allaccount.forEach(function(account){
                        account.accountName = '/'+account.Id;
                    });

                    component.set("v.accountData", allaccount);
                      // display a success message  
                      toastReference.setParams({
                        "type" : "Success",
                        "title" : "Success",
                        "message" : accountData.message,
                        "mode" : "dismissible"
                    });
                    toastReference.fire();
                }
            }  else{ // if any callback error, display error msg
                toastReference.setParams({
                    "type" : "Error",
                    "title" : "Error",
                    "message" : 'An error occurred during Initialization '+state,
                    "mode" : "sticky"
                });
                toastReference.fire();
            }
        });
        $A.enqueueAction(action);
    },

    //Thsi method is for loading data while go down on table
    loadDataAgain : function(component, event, helper)
    {
        return new Promise($A.getCallback(function(resolve)
        {
            var limit = component.get("v.initialRows");
            var offset = component.get("v.totalRecords");
            var totalRows = component.get("v.totalRows");
            console.log('Check LImit...> '+limit);
            console.log('Check offset...> '+offset);
            console.log('Check totalRows...> '+totalRows);
            if(limit+offset > totalRows)
            {

                limit = totalRows - offset;
                console.log('Check limit inside if condition...> '+limit);
            }
            var action = component.get("c.loadAccountRecords");
            action.setParams({
                "rowLimit" : limit,
                "rowOffset" : offset
            });

            action.setCallback(this, function(response)
            {
                
                var state = response.getState();
                var newData = response.getReturnValue();
                console.log('More Data-------> '+ JSON.stringify(newData));

                newData.forEach(function(account){
                    account.accountName = '/'+account.id;
                });
                resolve(newData);
                var currentCount = component.get("v.totalRecords");                    
                console.log('Check the current count value-----> '+currentCount);
                currentCount += component.get("v.initialRows");
                console.log('Check the current count value after adding-----> '+currentCount);
                component.set("v.totalRecords", currentCount);
            });
            $A.enqueueAction(action);
        }));
    }
})