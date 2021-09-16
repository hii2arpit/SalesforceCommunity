@isTest
public class TestDataFactory 
{
    public static void createTestRecord(Integer numAcct, Integer numContactsPerAcct)
    {
        List<Account> accts= new List<Account>();
        for(Integer i=0;i<numAcct; i++)
        {
            Account a= new Account(Name='TestAccount'+ i);
            accts.add(a);
        }
        insert accts;
        
        List<Contact> cons= new List<Contact>();
        for(Integer j=0; j<numAcct; j++)
        {
            Account acct= accts[j];
            for(Integer k=numContactsPerAcct*j;k<numContactsPerAcct*(j+1);k++)
            {
                cons.add(new Contact(firstname='Test'+k,
                                     lastname='Test'+k,
                                     AccountId=acct.Id));
            }
        }
        insert cons;
        system.debug('Test Pass');

    }

}