global class UpdateContactAddresses implements Database.Batchable<sObject>, Database.Stateful
{
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return database.getQueryLocator('Select ID, BillingState, BillingCity, BillingStreet,BillingPostalCode,(SELECT ID, MailingStreet, MailingCity,MailingState, MailingPostalCode FROM Contacts) from Account where billingCountry =\'USA\'');                                    
    }
    global void execute(Database.BatchableContext bc, List<Account> scope)
	{
        List<contact> contacts = new List<Contact>();
        for(Account a: scope)
        {
            for(Contact con: a.contacts)
            {
                con.MailingStreet = a.BillingStreet;
                con.MailingCity = a.BillingCity;
                con.MailingState = a.BillingState;
                con.MailingPostalCode = a.BillingPostalCode;
                
                contacts.add(con);
                recordsProcessed = recordsProcessed + 1;
            }
        }
        update contacts;                    
    }
     global void finish(Database.BatchableContext bc)
     {
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        // call some utility to send email
       // EmailUtils.sendMessage(job, recordsProcessed);
    }    
}