trigger abc on Account(before update)
{
set<id> s=new set<id>();
list<Contact> cont= new list<contact>();

    for(Account a: Trigger.new)
    {   
        s.add(a.id);
        cont=[select id,name from contact where accountid=:s order by createddate];
            
            integer i=1;
            integer totalcontact= cont.size()+1;
            for(contact c:cont)
            {
                c.firstName='';
                c.lastname=a.name+i;
                i++;        
                if(totalcontact==i)
                {
                c.Latest_Contact__c='Latest';
                a.Latest_Contact_Name__c= c.LastName;
                }
            }
            update cont;
    }
    
}