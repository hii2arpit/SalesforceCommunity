@isTest
private class SpecialAccountsTest 
{
    testMethod static void testAccountCreate()
    {
        SpecialAccounts.AccountInfo info= new SpecialAccounts.AccountInfo();
        info.Acctname='Arpit SFDC';
        info.AcctNumber= 123456;
        Account acct= SpecialAccounts.createAccount(info);
        system.assert(acct!=null);
    }
    

}