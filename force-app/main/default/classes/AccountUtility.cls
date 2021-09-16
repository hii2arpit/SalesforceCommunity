public class AccountUtility
{
    public static void viewAnnualRevenue()
    {
        list<Account> accountsList = new list<Account>();
        accountsList =[select name, annualrevenue from account];
        for(Account acc:accountsList)
        {
            String acctRev = acc.Name + ':' + acc.annualrevenue;
            system.debug(acctRev);
        }
    }

}