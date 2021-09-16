({
    doInit : function(component, event, helper) 
    {
        component.set("v.accountcolumns",[
                    {
                        label: 'Name',
                        fieldName: 'accountName',
                        type: 'url',
                        typeAttributes:{label:{fieldName:'Name'},target:'_blank'}
                    },
                    {
                        label: 'Account Source',
                        fieldName: 'AccountSource',
                        type: 'text',
                    },
                    {
                        label: 'Rating',
                        fieldName: 'Rating',
                        type: 'text'
                    }]);
        helper.getAccountData(component);
    },

    loadMoreData : function(component, event, helper)
    {
        console.log("Loading more data......");
        if(!(component.get("v.totalRecords") >= component.get("v.totalRows")))
        {
            //For showing spinner
            event.getSource().set("v.isLoading", true);

            //Load data again
            helper.loadDataAgain(component).then(function(data){
                 var currentData = component.get("v.accountData");
                 console.log('Check current data whcih is alrady there---> '+JSON.stringify(currentData));
                 var newData = currentData.concat(data);
                 console.log('Check new datat afterr concat------------> '+JSON.stringify(newData));
                 component.set("v.accountData", newData);
                 //Hide spinner
                 event.getSource().set("v.isLoading", false);
            });
        }
        else{
            component.set("v.enableInfiniteLoading", false);
            event.getSource().set("v.isLoading", false);
            var toastReference = $A.get("e.force:showToast");
            toastReference.setParams({
                "type":"Success",
                "title":"Success",
                "message": "All account record has been loaded.",
                "mode": "dismissible"
            });
            toastReference.fire();
        }
    }
})