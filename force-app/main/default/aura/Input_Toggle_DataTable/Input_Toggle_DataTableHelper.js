({
    getData : function(component, event,helper)
    {
        var action = component.get("c.getOppList");
        
        action.setCallback(this, function(response)
        {
            var state = response.getState();
            console.log('State---------------> '+state);
            if(state === 'SUCCESS')
            {
                var oppList = response.getReturnValue();               
                oppList.forEach(function(record)
                {
                    console.debug('Linkname is-------------> '+ record.OppName);
                    console.debug('Record Id is-------------> '+ record.Id);
                    record.OppName = '/'+record.Id;
                });
                component.set("v.Data", oppList);
            }else{
                console.log('Error occurd while inti of the data '+ state);
            }
        });
        $A.enqueueAction(action);
    }
})