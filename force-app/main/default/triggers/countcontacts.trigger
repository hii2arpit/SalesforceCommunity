trigger countcontacts on Contact (before insert) 
{
    Set<Id> aId = new Set<Id>();
      
        for(Contact opp : Trigger.New)
        {
            aId.add(opp.AccountId);
        
        }
        
        map<id,account>  acc =new map<id,account>( [select id,(select id  from contacts) from Account where Id in:aId]);
        for(Contact c : trigger.new)
        {
        if(c.accountid!=null)
        {
        if(acc.get(c.accountid).contacts.size()>=5)
        c.adderror('you can\'t insert this contact');
           }
        }
}