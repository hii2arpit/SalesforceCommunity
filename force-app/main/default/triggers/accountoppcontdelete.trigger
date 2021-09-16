trigger accountoppcontdelete on Account (before delete)
{
    list<opportunity> opp=new list<opportunity>();
    
    opp=[select id,name,accountid,(select ContactId,OpportunityId,Role from opportunitycontactroles) from opportunity where accountid in:Trigger.old];
    system.debug('query result-->>'+opp);
    for(account a:trigger.old)
    {
        for(opportunity o:opp)
        {
            system.debug('size---->>'+o.opportunitycontactroles.size());
            if(a.id==o.accountid && o.opportunitycontactroles.size()>0)
            {
                a.adderror('account cannot be deleted because opportunity contact role is available on opportunity');
            }
        }
    }
}