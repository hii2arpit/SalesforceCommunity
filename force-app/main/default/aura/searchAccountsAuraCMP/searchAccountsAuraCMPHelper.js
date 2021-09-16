({
    lodaData : function(component, event, helper)
    {
        var actions = [
            { label: 'Show details', name: 'show_details' },
            { label: 'Delete', name: 'delete' }
        ];
        component.set('v.columns', [
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'number'},
            {label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'number'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Rating', fieldName: 'Rating', type: 'number'},
            { type: 'action', typeAttributes: { rowActions: actions } }
        ]);

        var action = component.get("c.getAccounts");
        action.setCallback(this, function(response)
        {
            var state = response.getState();
            if(state === 'SUCCESS')
            {
                var result = response.getReturnValue();
                component.set("v.account", result);
            }else{
                alert("There is some error for getting data");
            }
        })
        $A.enqueueAction(action);
    },

    search : function(component, event, helper)
    {
        var key = component.get("v.searchKey");

        var data = component.get("v.account");

        var result = data, regex;

        regex = new RegExp(key,"i");

        result = data.filter(row => regex.test(row.Name));

        component.set("v.account", result);
    },

    deleteRow : function(component, row)
    {
        var rows  = component.get('v.account');
       alert('Deleted row.........>' +JSON.stringify(rows));
        var rowIndex = rows.indexOf(row);
        alert('Deleted row Index.........>' +JSON.stringify(row.Id));

        rows.splice(rowIndex, 1);
        component.set('v.account', rows);
    }
})