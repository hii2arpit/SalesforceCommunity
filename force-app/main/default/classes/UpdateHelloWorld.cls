public class UpdateHelloWorld 
{
    public static void updateaccount(list<account> act)
    {
        
        for(Account c: act)
        {
            c.Latest_Contact_Name__c = 'World';
        }
    }

}