({
    invoke : function(component, event, helper) 
    {
        var btnid = event.getSource().getLocalId();
        var a = component.find("fv").get("v.value");
        var b = component.find("sv").get("v.value");
        var res= 0;
        if(btnid == "addbtn")
        {
            res = parseInt(a) + parseInt(b);
            component.set("v.res", res);
        }
        if(btnid == "mulbtn")
        {
            res = parseInt(a) * parseInt(b);
            component.set("v.res", res);
        }

        if(btnid == "refreshbtn")
        {
            component.find("fv").set("v.value", null);
            component.find("sv").set("v.value", null);
            component.set("v.flag1",false);
        }

        if(res>0)
        {
            component.set("v.flag1", true);
        }
    }
})