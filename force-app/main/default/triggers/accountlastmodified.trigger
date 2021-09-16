trigger accountlastmodified on Account (before insert,before update) 
{
    if(stoprecursivetrigger.firstRun)
    {
        stoprecursivetrigger.firstRun = false;
        
        
        
    list<account> acc=new list<account>();
    list<contact> conlist=new list<contact>();
    if(Trigger.isinsert)
    {   
        for(account a:trigger.new)
        {
            a.Last_Modified__c=userinfo.getname();
        }
    }
    
    if(Trigger.isUpdate)
    {   
        conlist=[select id,Last_Modified__c from contact where accountid in:trigger.new];
        for(account a:Trigger.new)
        {
            a.Last_Modified__c=userinfo.getname();
            for(contact c:conlist)
            {
                c.Last_Modified__c=userinfo.getname();
            }
            update conlist;
            
        }
    } 
    }
}