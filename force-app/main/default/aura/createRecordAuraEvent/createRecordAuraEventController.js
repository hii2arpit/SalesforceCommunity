({
    createNewContact : function(component,event,helper) 
    {
        helper.createContact(component,event,helper);
    },

    navigateToUrl :function(component, event, helper)
    {
        helper.goToURL(component, event, helper);
    },
    navigateToListView :function(component, event, helper)
    {
        helper.listViewNavigate(component, event, helper);
    }
})