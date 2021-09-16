({
    invoke : function(component, event, helper) 
    {
        var a = component.find("fv").get("v.value");
        var b = component.find("sv").get("v.value");

        var btnid = event.getSource().getLocalId();
        var btnName = event.getSource().get("v.name");

        var res = 0;

        if(btnid == 'btnAdd')
        {
            res = parseInt(a) + parseInt(b);
            component.set("v.result", res);
        }
        if(btnid == 'btnMul')
        {
            res = parseInt(a) * parseInt(b);
            component.set("v.result", res);
        }
    }
})