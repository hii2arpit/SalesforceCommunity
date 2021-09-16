public class cont
{
    private Account account;

    public cont()
    {
    account=[SELECT Id,Name,phone From account where Id=:Apexpages.currentpage().getparameters().get('Id')];
    }
    
    public Account getAccount()
    {
    return account;
    }
    
    public pageReference save()
    {
    update account;
    return null;
    }
}