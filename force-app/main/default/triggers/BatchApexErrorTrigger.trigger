trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) 
{
    List<BatchLeadConvertErrors__c> Recordetails = new List<BatchLeadConvertErrors__c>();
    for(BatchApexErrorEvent rec: Trigger.new)
    {
        BatchLeadConvertErrors__c r = new BatchLeadConvertErrors__c();
        r.AsyncApexJobId__c = rec.AsyncApexJobId;
        r.Records__c = rec.JobScope;
        r.StackTrace__c = rec.StackTrace;
        
        Recordetails.add(r);
    }
    if(Recordetails.size()>0)
    {
        insert Recordetails;
    }
}