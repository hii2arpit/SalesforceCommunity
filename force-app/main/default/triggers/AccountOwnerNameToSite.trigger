trigger AccountOwnerNameToSite on Account (before insert, before update) 
{
    set<id> ownerid = new set<id>();
    list<user> userlist = new list<user>();
    map<id, user> usermap1 = new map<id, user>();
    if(Trigger.isInsert || Trigger.isUpdate)
    {
        for(Account acc:Trigger.new)
        {
            ownerid.add(acc.ownerid);
        }
    }
    userlist = [select id, name from user where id in: ownerid];
    
    for(user u: userlist)
    {
        usermap1.put(u.id, u);
    }
 //   map<id, user> usermap = new map<id, user>([select id, name from user where id in: ownerid]);
    
    for(Account ac: Trigger.new)
    {      
        user u = usermap1.get(ac.OwnerId);
        ac.Site = u.Name;
    }
}