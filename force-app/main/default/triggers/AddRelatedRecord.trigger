trigger AddRelatedRecord on Account (after insert,after Update)
{
    List<opportunity> oppList= new List<Opportunity>();
    
    for(Account a:[SELECT Id,Name FROM Account WHERE Id IN:Trigger.New AND Id NOT IN(SELECT AccountId FROM Opportunity)])
    {
        oppList.add(new Opportunity(Name=a.Name+'Opportunity',
                                   StageName='Prospecting',
                                   CloseDate=System.today().addMonths(1),
                                   AccountId=a.Id));
    }
    if(OppList.size()>0)
    {
        Insert OppList;
    }

}