@isTest
public class AddPrimaryContactTest 
{
    static testmethod void setup()
    {
        List<Account> accounts = new List<Account>();
            for(Integer i=0;i<50;i++)
            {
                accounts.add(new account(name='TestAccount'+i,BillingState='NY'));
            }
            for(Integer j=0;j<50;j++)
            {
                accounts.add(new account(name='TestAccount'+j,BillingState='CA'));
            }
                insert accounts;
        
        contact co = new contact();
        co.firstname='demo';
        co.lastname='demo';
        insert co;
        
        String s = 'CA';
      
			 AddPrimaryContact apc = new AddPrimaryContact(co, s);
    		Test.startTest();       
	        System.enqueueJob(apc);
	        Test.stopTest();
        
        for(Account a: accounts)
        {
            if(a.billingState =='CA')
            {
                System.assertEquals(1,a.Number_of_contacts__c);
            }
        }
    }
}