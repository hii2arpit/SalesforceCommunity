({
    AddNewRow : function(component, event, helper){
       // fire the AddNewRowEvt Lightning Event 
        component.getEvent("AddRowEvt").fire();     
    },
    
    removeRow : function(component, event, helper){
     // fire the DeleteRowEvt Lightning Event and pass the deleted Row Index to Event parameter/attribute
       component.getEvent("DeleteRowEvt").setParams({"indexVar" : component.get("v.rowIndex") }).fire();
    }, 
    getvalue : function(component, event, helper)
    {
        var name = component.get('v.accountInstance.FirstName');
        alert('Getting name--->'+name);
    },
    getvalue1 : function(component, event, helper)
    {
        var name = component.get('v.accountInstance.FirstName');
        alert('Getting name--->'+name);
    },
    getvalue2 : function(component, event, helper)
    {
        var name = component.get('v.accountInstance.FirstName');
        alert('Getting name--->'+name);
    },
  
})