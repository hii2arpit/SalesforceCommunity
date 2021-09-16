({
    displayAccount : function(component, event, helper)
    {
        console.log('Inside display Account');
        var col = [
            {label:'Account Name', fieldName:'Name', type:'text'},
            {label:'Account Phone', fieldName:'Phone', type:'text'},
            {label:'Account Industry', fieldName:'Industry', type:'text'}
        ];

        component.set("v.columns",col);
        var key = event.getParam("searchKey");
        console.log('Check the key value-----> '+ key);
        var action = component.get("c.getAccount");
        action.setParams({"strIndustry":key});
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log('check the state of the response------> '+ state);
            if(state === 'SUCCESS')
            {
                var result = response.getReturnValue();
                console.log('Searched Data=-----> '+ JSON.stringify(result));
                component.set("v.lstAccount",result);
                component.set("v.flag", true);
            }
        });
        $A.enqueueAction(action);
    }
})