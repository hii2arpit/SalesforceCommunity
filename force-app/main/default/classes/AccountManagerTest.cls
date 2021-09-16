@isTest
public class AccountManagerTest 
{
    @isTest static void testGetAccountById() 
    {
        Account acc = new Account(Name='Test');
        insert acc;
        
        Contact cont = new Contact(LastName = 'test Contact',Email = 'test@gmail.com', AccountId = acc.Id);
	    insert cont;
        
        Id recordId = acc.id;
         RestRequest request = new RestRequest();
        request.requestUri ='https://arpit1992-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test', thisAccount.Name);   
    }

}