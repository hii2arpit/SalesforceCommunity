trigger GetAccountLookupfromContact on Customer_Project__c (before insert) 
{	
    list<contact> cont = new list<contact>();
    set<id> cotid = new set<id>();
    if(Trigger.isInsert)
    {
        for(Customer_Project__c cp: Trigger.new)
        {
            if(cp.Contact__c!=null)
            {
                cotid.add(cp.Contact__c);
            }
        }
        if(cotid.size()>0)
        {
            cont = [select id, accountid from contact where id in: cotid];
        }
        
        for(contact c: cont)
        {
            if(c.AccountId != null)
            {
                for(Customer_Project__c cp: Trigger.new)
        		{
                    if(c.id == cp.Contact__c)
                    {
                        cp.Account__c = c.AccountId;     
                    }
            	}
            }
        }
    }
}