trigger preventfromduplicateaccount on Account (before insert) 
{
    for(account act:Trigger.new)
    {
       list<account> a = [select id, name from account where name=: act.name];
        if(a.size()>0)
        {
            act.name.adderror('Account with this name is already created');
        }
    }

}