trigger Contactdelete on Contact(after delete, after insert)
{
set<id> s= new set<id>();
list<contact>cnt=new list<contact>();
set<id> newcontact= new set<id>();
list<contact>cntt=new list<contact>();
    
            if(Trigger.isDelete)
            {
                for(Contact c: Trigger.old)
                {
                s.add(c.AccountId);
                }
                cnt=[SELECT Id,AccountId,Account.Name,Name FROM contact where accountid=:s order by createddate asc];
                if(cnt.size()>0)
                {
                    Integer contactListSize = cnt.size()-1;
                    contact lastcontact=cnt[contactListSize];
                    lastcontact.Latest_Contact__c='Latest';
                    update cnt;
                }
            }
                        
        if(Trigger.isInsert)
            {
                for(Contact cc: Trigger.New)
                {
                    newcontact.add(cc.AccountId);
                }
                cntt=[SELECT Id,AccountId,Name FROM contact where accountid=:newcontact order by createddate asc];
                if(cntt.size()>0)
                {
                    for(contact c: cntt)
                    {
                    c.Latest_Contact__c='';
                    Integer contactListSize = cntt.size()-1;
                    contact lastcontact=cntt[contactListSize];
                    lastcontact.Latest_Contact__c='Latest';
                    }
                }
                    update cntt;
            }
}