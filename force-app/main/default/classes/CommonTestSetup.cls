@isTest
public class CommonTestSetup 
{
    @testSetup static void setup()
    {
        List<Account> testAccts= new List<Account>();
        for(Integer i=0; i<3; i++)
        {
            testAccts.add(new Account(Name='TestAccts '+ i));
        }
        insert testAccts;
    }
    @isTest static void method1()
    {
        Account acct=[SELECT Id FROM Account Where Name='TestAccts0' LIMIT 1];
        acct.Phone='123456789';
        update acct;
    
        Account acct2=[SELECT Id FROM Account Where Name='TestAccts1' LIMIT 1];
        delete acct2;
    }
    @isTest Static void method2()
    {
    	Account acct=[SELECT Id FROM Account WHERE name='TestAccts0' LIMIT 1];
   	 	system.assertEquals(null,acct.Phone);
        
        Account acct2=[SELECT Id FROM Account WHERE Name='TestAccts1' LIMIT 1];
        system.assertNotEquals(null,acct2);
    }
    

}