trigger ContactCreatenumber on Account (after insert) 
{
    list<contact> contlist = new list<contact>();
    set<id> accid = new set<id>();
  
    
    for(account a: Trigger.new)
    {
        if(a.Number_of_contact__c != null)
        {
            for(integer i=0; i<a.Number_of_contact__c; i++)
            {
                contact con = new contact();
                con.FirstName = 'Test' + i;
                con.LastName = 'Arpit' + i;
                con.AccountId = a.Id;
                contlist.add(con);
            }
        }
        
    }
    
    if(contlist.size()>0)
    {
        insert contlist;
    }

}