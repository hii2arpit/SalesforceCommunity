@isTest
public class UpdateParentAccountTest 
{
    @testSetup
    
    static void setup()
    {
        List<Account> accounts = new List<Account>();
        accounts.add(new account(name='parent'));
        
        for(Integer i=0;i<100;i++)
        {
            accounts.add(new account(name='TestAccount'+i));
        }
        insert accounts;
    }
    
    static testmethod void testQueueable()
    {
        id parentid = [select id from account where name = 'parent'][0].id;
        
        List<Account> accounts = [select id, name from account where name like 'TestAccount%'];
        UpdateParentAccount upa = new UpdateParentAccount(accounts, parentid);
        
        Test.StartTest();
        System.enqueueJob(upa);
        Test.StopTest();
        
        System.AssertEquals(100,[select count() from account where parentId = :parentId]);	
        
    }

}