trigger contactlastmodified on Contact (before insert, before update) 
{
 if(stoprecursivetrigger.firstRun)
    {
        stoprecursivetrigger.firstRun = false;
        
    list<account>acc=new list<account>();
    list<contact>conlist=new list<contact>();
    set<id> acid=new set<id>();
    if(trigger.isinsert)
    {
        for(contact c:trigger.new)
        {
            c.Last_Modified__c=userinfo.getname();
        }
    }
    
    if(trigger.isupdate)
    {
        conlist=[select id,Last_Modified__c,accountid from contact where id in:trigger.new];
        for(contact cc:conlist)
        {
            acid.add(cc.accountid);
        }
        acc=[select id,Last_Modified__c,name from account where id in:acid];
        system.debug('aaclist--->>>'+acc);
        for(contact c:trigger.new)
        {
            c.Last_Modified__c=userinfo.getname();
            for(account a:acc)
            {
                a.Last_Modified__c=userinfo.getname();
            }
            update acc;
        }
    }
  }
}