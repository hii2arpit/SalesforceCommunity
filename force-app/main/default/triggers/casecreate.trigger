trigger casecreate on Case (before insert) 
{
    
    for(case c:Trigger.new)
    {
        if(c.Origin == 'email')
        {
            c.status='new';
            c.Priority='normal';
        }
    }

}