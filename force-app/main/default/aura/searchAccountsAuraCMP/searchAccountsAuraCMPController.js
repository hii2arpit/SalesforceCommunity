({
    doInit : function(component, event, helper) 
    {
        helper.lodaData(component, event, helper);

    },

    searchAccount : function(component, event, helper)
    {
        helper.search(component, event, helper);

    },
    rowAction : function(component, event, helper)
    {
        console.log('inside Row Action........');
        var action = event.getParam('action');
        var row = event.getParam('row');
        console.log('NAme of the action->'+action.name);

        switch(action.name)
        {
            case 'show_details':
                alert('Showing Details: '+ JSON.stringify(row));
                break;
            case 'delete':
                helper.deleteRow(component, row);
                break;
        }
    }
});