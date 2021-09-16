trigger AcountPriceUpdate on Account (before insert, before update) 
{
    for(Account a:Trigger.new)
    {
        if(a.Principal__c != null)
        {
            a.Principal__c = a.Principal__c - (a.Principal__c *0.15);
        }
    }
    

}