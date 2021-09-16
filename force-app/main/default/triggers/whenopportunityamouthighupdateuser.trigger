trigger whenopportunityamouthighupdateuser on Opportunity (before insert) 
{
    /*
    list<OpportunityTeamMember> otm = new list<OpportunityTeamMember>();
    
    user u = [select id, name from user where alias='Arpit'];
    
    for(Opportunity o:Trigger.new)
    {
        if(o.amount>10000)
        {
            OpportunityTeamMember atm = new OpportunityTeamMember();
            atm.UserId = u.id;
            atm.OpportunityId = o.id;
            atm.TeamMemberRole = 'Opportunity manager';
            atm.OpportunityAccessLevel= 'All';
            
            otm.add(atm);
        }
    }
    if(otm.size()>0)
    {
        insert otm;
        
    }
   */ 
}