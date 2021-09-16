@isTest
private class AccountProcessorTest 
{
    @isTest
    public static void testNoOfContacts()
    {
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;
        
        Contact c = new Contact();
        c.FirstName = 'Bob';
        c.LastName =  'Willie';
        c.AccountId = a.Id;
        
        Contact c2 = new Contact();
        c2.FirstName = 'Tom';
        c2.LastName = 'Cruise';
        c2.AccountId = a.Id;
        
        List<Id> acctId = new List<Id>();
        acctId.add(a.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(acctid);
        Test.stopTest();
    }
}