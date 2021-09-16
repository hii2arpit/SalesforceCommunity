({
   
    
    // Load expenses from Salesforce
	doInit: function(component, event, helper) {
    // Create the action
    var action = component.get("c.getExpenses");

    // Add callback behavior for when response is received
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            component.set("v.expenses", response.getReturnValue());
        }
        else {
            console.log("Failed with state: " + state);
        }
    });
    // Send action off to be executed
    $A.enqueueAction(action);
	},



createExpense: function(component, expense) {
    var action = component.get("c.saveExpense");
    action.setParams({
        "expense": expense
    });
    action.setCallback(this, function(response){
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            var expenses = component.get("v.expenses");
            expenses.push(response.getReturnValue());
            component.set("v.expenses", expenses);
        }
    });
    $A.enqueueAction(action);
},

})