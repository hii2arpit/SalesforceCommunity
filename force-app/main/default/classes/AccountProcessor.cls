global class AccountProcessor 
{
    
    @future(callout=true)
    public static void countContacts(List<Id> accountid)
    {
        List<Account> acnt = [select id, Number_of_Contacts__c from account where id=: accountid];
        List<Account> updatedAccounts = new List<Account>();
        for(Account acc: acnt)
        {
            acc.Number_of_Contacts__c = [select count() from contact where Accountid=: accountid];
            updatedAccounts.add(acc);
        }
        update updatedAccounts;
    }

}