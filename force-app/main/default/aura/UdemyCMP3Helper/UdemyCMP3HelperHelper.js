({
    calculate : function(c, actionName)
    {
        var a = c.get("v.first");
        var b = c.get("v.second");
        var result = 0;

        if(actionName == 'add')
        {
            c.set("v.add",(a+b));
        }
        if(actionName == 'mul')
        {
            c.set("v.mul", (a*b));
        }
    }
})