trigger UpdateContactPhoneAccountUpdate on Account (before update) 
{
    map<id,account> oldact = Trigger.oldmap;
    map<id,account> newsct = Trigger.newMap;
    list<contact> contlist = new list<contact>();
    set<id> oldid = oldact.keySet();
    set<id> updatedaccount = new set<id>();
    for(id i:oldid)
    {
        if(newsct.containsKey(i))
        {
            account old = oldact.get(i);
            account newa = newsct.get(i);
            
            if(old.phone!= newa.Phone)
            {
               updatedaccount.add(i); 
            }
        }
    }
    
    if(updatedaccount.size()>0)
    {
        contlist = [select id, phone, otherphone, accountid from contact where accountid in: updatedaccount];
    }
	
    for(contact c:contlist)
    {
        account old = oldact.get(c.AccountId);
        account newa = newsct.get(c.Accountid);
        
        if(old.Phone!=null)
        {
            c.OtherPhone = old.Phone;  
        }
        
        c.Phone = newa.phone;
    }
    update contlist;
}