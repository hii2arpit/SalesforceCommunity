trigger TotalContacts on Contact (after insert, after update, after delete, after undelete)
{
    Map<id, List<contact>> mapofcontact = new Map<id, List<contact>>();
    Map<id, List<contact>> oldmapofcontact = new Map<id, List<contact>>();
    list<id> accntid = new list<id>();
    List<contact> con = new List<contact>();
    list<account> acct = new list<Account>();
    if(Trigger.isInsert)
    {
       for(contact con:Trigger.new)
   	   {
         if(con.AccountId!= null)
         {
             if(!mapofcontact.containsKey(con.AccountId))
             {
                 mapofcontact.put(con.AccountId, new list<contact>());
             }
            
             mapofcontact.get(con.AccountId).add(con);
             accntid.add(con.accountid);
         }
      } 
   }
    
    if(Trigger.isUpdate)
    {
        for(Contact c: Trigger.new)
        {
            if(c.accountid != null && c.Accountid !=Trigger.oldMap.get(c.id).accountid)
            {
                if(!mapofcontact.containsKey(c.AccountId))
                {
                    mapofcontact.put(c.AccountId, new list<contact>());
                }
                mapofcontact.get(c.AccountId).add(c);
                accntid.add(c.AccountId);
            }
          /*  else if(String.isNotBlank(c.accountid) && String.isNotBlank(Trigger.oldMap.get(c.id).accountid))
            {
                if(!oldmapofcontact.containsKey(c.AccountId))
                {
                    oldmapofcontact.put(c.AccountId, new list<contact>());
                }
                oldmapofcontact.get(c.AccountId).add(c);
                accntid.add(Trigger.oldMap.get(c.id).accountid);
            } */
                
            }
     }
    
    if(Trigger.isDelete)
    {
        For(contact c:Trigger.old)
        {
            if(String.isNotblank(c.AccountId))
            {
                if(!oldmapofcontact.containsKey(c.AccountId))
                {
                    oldmapofcontact.put(c.AccountId,new list<contact>());
                }
                oldmapofcontact.get(c.AccountId).add(c);
                accntid.add(c.AccountId);
            }
        }
    }
    
    if(Trigger.isUndelete)
    {
        for(contact uc:Trigger.new)
        {
            if(String.isNotblank(uc.accountid))
            {
                if(!mapofcontact.containsKey(uc.AccountId))
                {
                    mapofcontact.put(uc.accountid, new list<contact>());
                }
                mapofcontact.get(uc.accountid).add(uc);
                accntid.add(uc.accountid);
            }
        }
    }
    
    if(accntid.size()>0)
    {
        acct = [select id,Number_of_Contacts__c, (select id, Total_Contacts__c from contacts) from account where id in:accntid];
        
        for(Account a: acct)
        {
           integer noofcontacts =0;
            if(mapofcontact.containsKey(a.id))
            {
                noofcontacts += mapofcontact.get(a.id).size();                
            }
            if(oldmapofcontact.containsKey(a.id))
            {
                noofcontacts -= oldmapofcontact.get(a.id).size();
            }
    a.Number_of_Contacts__c = a.Number_of_Contacts__c ==null ? noofcontacts:(a.Number_of_Contacts__c+noofcontacts);         
    update acct;
    	}
	}
}