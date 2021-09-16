global class DailyLeadProcessor implements schedulable
{
    global void execute(SchedulableContext cxt)
    {
        List<lead> la = [select id, LeadSource from lead where LeadSource = null];
        for(lead l: la)
        {
            l.leadsource = 'Dreamforce';
        }
        update la;
    }
}