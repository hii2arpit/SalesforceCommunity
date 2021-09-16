trigger AddOppOwnertoSalesTeam on Opportunity (after insert)
{
    List<opportunity> opps = new List<opportunity>();
    set<id> oppid = new set<id>();
    List<OpportunityTeamMember> oppmem = new List<OpportunityTeamMember>();

    for(Opportunity o:Trigger.new)
    {
        OpportunityTeamMember otm = new OpportunityTeamMember ();
        otm.opportunityid = o.id;
        otm.UserId = o.OwnerId;
        otm.TeamMemberRole = 'Sales Manager Role';
        oppmem.add(otm);
        System.debug('check else....................................456');
    }
    if(oppmem.size()>0)
    {
        System.debug('inser opm.........................');
        insert oppmem;
    }

}