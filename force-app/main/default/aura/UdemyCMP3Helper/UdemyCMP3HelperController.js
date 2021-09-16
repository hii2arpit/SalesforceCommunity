({
    doInit: function(component, event, helper)
    {
        component.set("v.first", 100);
        component.set("v.second", 200);
        component.set("v.add",0);
        component.set("v.mul",0);

    },
    add : function(component, event, helper) 
    {
        helper.calculate(component, 'add');
    },
    mul: function(component, event,  helper)
    {
        helper.calculate(component,'mul');
    }
})