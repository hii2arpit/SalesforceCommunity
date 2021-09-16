trigger get_Book on Customer_Project__c (before insert, Before update) 
{
    set<id> conid = new set<id>();
    map<id,id> mapofbook = new map<id,id>();
    for(Customer_Project__c cp: Trigger.new)
    {
        if(cp.Contact__c!=null)
        {
            conid.add(cp.Contact__c);
        }
        
          List<contact> cont  = [select id, Book__c from contact where id in: conid];
        for(contact con: cont)
        {
            
           mapofbook.put(con.id,con.Book__c);    
        }
           
        for(id i:conid)
        {
            cp.Book__c = mapofbook.get(i);
        }        
    }

}