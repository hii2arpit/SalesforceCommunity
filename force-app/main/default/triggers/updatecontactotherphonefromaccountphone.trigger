trigger updatecontactotherphonefromaccountphone on Contact (before insert) 
{
    set<id> actid = new set<id>();
    list<account> act = new list<account>();
    for(contact c:Trigger.new)
    {
        if(c.accountid!=null)
        {
            actid.add(c.accountid);
        }
    }
    
    act = [select id, phone from account where id in: actid];
    
    for(contact c: Trigger.new)
    {
        for(account a:act)
        {
            if(a.phone!=null)
            {
                c.OtherPhone = a.Phone;
            }
            
        }
        
        
    }

}