trigger updateopportunitycitywhenaccountcityupdated on Account (before update) 
{
    map<id, account> oldact = Trigger.oldmap;
    map<id, account> newact = Trigger.newmap;
    list<opportunity> opplist = new list<opportunity>();
    set<id> oldid = oldact.keySet();
    set<id> newactcity = new set<id>();
    for(id i:oldid)
    {
        if(newact.containsKey(i))
        {
            account old = oldact.get(i);
            account newa = newact.get(i);
            
            
            if(old.Last_Modified__c!=newa.Last_Modified__c)
            {
                newactcity.add(i);
            }
        }
    }
    
    opplist = [select id, CurrentGenerators__c from opportunity where accountid in: newactcity];

    if(opplist.size()>0)
    {
       for(Account a: Trigger.new)
    	{
            for(opportunity o:opplist)
            {
                if(a.Last_Modified__c!=null)
                {
                    o.CurrentGenerators__c = a.Last_Modified__c;
                }
            }
    	} 
    }
    
    update opplist;
    
}