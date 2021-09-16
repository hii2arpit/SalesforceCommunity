({
    doInit: function (component, event, helper) {
        var action = component.get("c.getAccounts");
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                // var result = response.getReturnValue();
                // component.set("v.lstAccounts", result);
                // component.set("v.flag", true);

                var contactList = response.getReturnValue();
                console.log('Check length of account---> ' + contactList.length);
                for (var i = 0; i < contactList.length; i++) {
                    var con = contactList[i];
                    con.oldName = con.Name; //Populating oldName for comparision 
                }
                component.set("v.lstAccounts", contactList);
                // component.set("v.flag", true);
            }
        });
        $A.enqueueAction(action);
    }
})