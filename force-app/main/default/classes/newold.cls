public class newold
{
    public Account account{get; private set;}
    
    public newold()
    {
    id id=Apexpages.currentpage().getParameters().get('id');
    
    account=(id==null)? new Account():[SELECT name,Phone,Industry from account where id=:id];
    
    }
    
    public pageReference save()
    {
        try 
        {
        upsert (account);
        }catch(system.dmlException e)
        {
        Apexpages.addMessages(e);
        return null;
        }
        pageReference redirectSuccess= new ApexPages.StandardController(Account).View();
        return redirectSuccess;
    }


}