global class RemindOpptyOwners implements schedulable
{
    global void execute(SchedulableContext cxt)
    {
        List<opportunity> oops =[Select id,name,ownerid, closedate from opportunity where isClosed = False and closeDate<Today];
    }

}