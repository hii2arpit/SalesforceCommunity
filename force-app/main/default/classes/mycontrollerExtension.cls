public class mycontrollerExtension
{
    private final Account acct;
    
    public mycontrollerExtension(ApexPages.StandardController stdController)
    {
        this.acct=(Account)stdController.getRecord();
    }
    
    public String getgreeting()
    {
        return 'Hello'+acct.name+'(' + acct.id + ')';
    }
}