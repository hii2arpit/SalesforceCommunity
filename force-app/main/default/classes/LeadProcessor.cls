global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful
{
    Date todayDate = Date.today()-1;
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return database.getQueryLocator('Select ID, name from account where SLAExpirationDate__c =: todayDate');                                    
    }
    global void execute(Database.BatchableContext bc, List<Account> scope)
	{
        set<id> accountId = new set<Id>();
        for(Account a: scope)
        {
            accountId.add(a.Id);
        }
      List<contact> contacts = new List<Contact>();
      contacts = [select id,SSN__c,Department from contact where AccountId IN: accountId];
        
          for(contact c: contacts)
          {
            c.SSN__c = 100;
            c.Department = 'Update From Schedule Class';
          }
		update contacts;                 
    }
    global void finish(Database.BatchableContext bc)
    {
    }    
}