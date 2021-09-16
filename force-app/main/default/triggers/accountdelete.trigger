trigger accountdelete on Account (before delete) 
{
list<account> acclist=new list<account>();
acclist=[select id,name,(Select id,Name,Accountid from opportunities) from account where id IN :Trigger.old];
    for(Account acc:Trigger.old)
    {           
        for(Account a:acclist)
        {
            if(acc.id==a.id)
            {
                if(a.opportunities.size()>0)
                {
                acc.name.adderror('Account cannot deleted');
                }
            }
        }
    }
}