@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager 
{
    @HttpGet
    global static account getAccount()
    {
        RestRequest request = RestContext.request;
        String AccountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account result =  [SELECT Id, Name ,(Select id, name from contacts)FROM Account WHERE Id = :AccountId Limit 1];
        return result;
    }
}