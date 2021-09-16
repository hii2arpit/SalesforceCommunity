({
    displayAccount : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'number'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'}
        ]);

        var accrecord = event.getParam("acc");
        console.log("Accoutn data--Arpit Jain---"+JSON.stringify(accrecord));
        if(accrecord!= '')
        {
            component.set("v.acc",accrecord);
            component.set("v.flag", true);
        }

    }
})