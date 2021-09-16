public class VfOrderExp2Extension 
{
    Private final Account acct;
    Integer EmpAdd;
    
    public VfOrderExp2Extension(VfOrderExp2 exp)
    {
        this.acct=(Account)exp.getAccount();
    }
    
    public String getGreeting()
    {
     return acct.name +'Current Information';   
    }
    
    public void resetemp()
    {
        acct.NumberOfEmployees=50;
        update acct;
    }
}