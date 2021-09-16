trigger DeleteOpportunity on Opportunity (before delete)
{
    Id user = userinfo.getProfileId();
    String profile_name = [select id, name from profile where ID=:user].Name;
    for(opportunity o: Trigger.old)
    {
        if(profile_name != 'System Administrator' && o.probability >=0.75)
        {
            o.addError('Non admin user cannot delete if probability is greater than equal to 75%');
        }
       
    }
}