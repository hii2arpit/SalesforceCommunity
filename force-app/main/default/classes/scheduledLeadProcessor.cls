global class scheduledLeadProcessor implements Schedulable 
{
   global void execute(SchedulableContext SC) 
   {
      LeadProcessor  LP = new LeadProcessor ();
      database.executebatch(LP);
    }
}