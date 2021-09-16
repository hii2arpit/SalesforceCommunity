global class SpecialAccounts 
{
    global class AccountInfo
    {
        webService String Acctname;
        webService Integer AcctNumber;
    }
    webService static Account createAccount(AccountInfo info)
    {
        Account acct= new Account();
        acct.name=info.Acctname;
        acct.AccountNumber= String.valueof(info.AcctNumber);
        insert acct;
        return acct;
    }
    webService static Id[] createAccounts(Account Parent, Account child, Account grandChild)
    {
        insert parent;
        child.ParentId= parent.Id;
        insert child;
        grandchild.ParentId=child.Id;
        insert grandchild;
        
        Id[] results= new Id[3];
        results[0]=parent.Id;
        results[1]=child.Id;
        results[2]=grandChild.Id;
        return results;
    }

}