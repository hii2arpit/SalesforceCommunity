trigger ClosedOpportunityTrigger on Opportunity (after insert,after update)
{
    List<task> task= new List<task>();
     for(Opportunity o:Trigger.new)
    {
        if(o.StageName=='Closed Won')
        {
            task t= new task();
            t.Subject='Follow up Test Task';
            t.WhatId=o.id;
            task.add(t);
        }
    }
    if(task.size()>0)
    {
    insert task;
    }
}