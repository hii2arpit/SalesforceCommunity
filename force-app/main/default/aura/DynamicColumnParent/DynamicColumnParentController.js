({
    doInit : function(component, event, helper) {
        
         helper.createRowForPersonnel(component, event, helper);
         helper.createRowForFringe(component, event, helper);
    },

    // function for create new object Row in Contact List 
    addNewRow : function(component, event, helper) {
        // call the comman "createObjectData" helper method for add new Object Row to List  
        helper.createRowForPersonnel(component, event);
    },
    addNewFringeRow : function(component, event, helper) {
        // call the comman "createObjectData" helper method for add new Object Row to List  
        helper.createRowForFringe(component, event, helper);
    },
    
     // function for delete the row 
    //  removeDeletedRowPersonnel: function(component, event, helper) {
    //     // get the selected row Index for delete, from Lightning Event Attribute  
    //     var ctarget = event.currentTarget;
    //     console.log('Deleting target-->'+ctarget);
    //     var index = ctarget.dataset.value;
    //     console.log('Deleting index-->'+index);
    //     // get the all List (contactList attribute) and remove the Object Element Using splice method    
    //     var AllRowsList = component.get("v.account");
    //     console.log('Print the lkist of object-->'+ AllRowsList)
    //     AllRowsList.splice(index, 1);
    //     console.log('Print the list of object after delete-->'+ AllRowsList)

    //     // set the contactList after remove selected row element  
    //     component.set("v.account", AllRowsList);

    // },
    removeDeletedRow: function(component, event, helper) {
        // get the selected row Index for delete, from Lightning Event Attribute  
        var index = event.getParam("indexVar");
        // get the all List (contactList attribute) and remove the Object Element Using splice method    
        var AllRowsList = component.get("v.rowlist");
        AllRowsList.splice(index, 1);
        // set the contactList after remove selected row element  
        component.set("v.rowlist", AllRowsList);
    },
    // function for delete the row 
    removeDeletedRowFringe: function(component, event, helper) {
        // get the selected row Index for delete, from Lightning Event Attribute  
        var ctarget = event.currentTarget;
        console.log('Deleting target-->'+ctarget);
        var index = ctarget.dataset.value;
        console.log('Deleting index-->'+index);

        // get the all List (contactList attribute) and remove the Object Element Using splice method    
        var AllRowsList1 = component.get("v.account1");
        console.log('Print the lkist of object-->'+ AllRowsList1)
        AllRowsList1.splice(index, 1);
        console.log('Print the list of object after delete-->'+ AllRowsList1)

        // set the contactList after remove selected row element  
        component.set("v.account1", AllRowsList1);

    },
    formPress : function(cmp, event, helper)
    {
        var isEnterKey = event.keyCode === 13;
        //var toMail = component.find("someId").get("v.value");
        var entersearch = cmp.get("{!v.myEnterSearch}");
       // var toMail = cmp.find("div1");
        alert('To Mail id--->'+entersearch);
        // if (isEnterKey) {
        //    // var queryTerm = cmp.find('myAtt').get('v.value');
        //    var queryTerm = event.getSource(); 
        //    alert('Searched for "' + queryTerm + '"!');
        // }

    },
    // formPress1 : function(cmp, event, helper)
    // {
    //     var isEnterKey = event.keyCode === 13;
    //     var entersearch = cmp.get("{!v.myEnterSearch}");
    //     alert('To Mail id--->'+entersearch);
    // }
})