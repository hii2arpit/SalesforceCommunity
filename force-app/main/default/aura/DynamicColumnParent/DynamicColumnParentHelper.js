({
    createRowForPersonnel : function(component, event, helper) 
    {
        var RowItemList = component.get("v.account1");
        RowItemList.push({
            'sobjectType': 'account'
        });
         // set the updated list to attribute (contactList) again            
         component.set("v.account1", []);      
         component.set("v.account1", RowItemList);

         //---------------
         var RowItemList = component.get("v.account2");
         RowItemList.push({
             'sobjectType': 'account'
         });
          // set the updated list to attribute (contactList) again            
          component.set("v.account2", []);      
          component.set("v.account2", RowItemList);

          //------------------- 
          var RowItemList = component.get("v.account3");
          RowItemList.push({
              'sobjectType': 'account'
          });
           // set the updated list to attribute (contactList) again            
           component.set("v.account3", []);      
           component.set("v.account3", RowItemList);
         
    },
    createRowForFringe : function(component, event, helper) 
    {
        var RowItemList = component.get("v.account1");
        RowItemList.push({
            'sobjectType': 'account'
        });
         // set the updated list to attribute (contactList) again            
         component.set("v.account1", []);      
         component.set("v.account1", RowItemList);
    },


})