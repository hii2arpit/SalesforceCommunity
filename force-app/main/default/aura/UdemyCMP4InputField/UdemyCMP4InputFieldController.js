({
    CalculateNetSalary : function(component, event, helper) 
    {
        var Salary = component.get("v.sal");
        var taxval=component.get("v.tax");
        var netSalary = (Salary) - (Salary*taxval/100);
        component.set("v.nsal", netSalary);
    },
    refreshData: function(component, event, helper)
    {
        component.set("v.fname", null);
        component.set("v.lname", null);
        component.set("v.sal", null);
        component.set("v.tax", null);
        component.set("v.nsal", null);
    }
})