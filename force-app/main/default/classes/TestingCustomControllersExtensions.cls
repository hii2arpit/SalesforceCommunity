public class TestingCustomControllersExtensions
{
    private String firstName;
    private String lastName;
    private String Company;
    private String email;
    private String qp;
    
    public TestingCustomControllersExtensions()
    {
        this.qp=ApexPages.currentpage().getParameters().get('qp');
    }
    
    public String getFirstName()
    {
       return this.FirstName;
    }
    
    public void setfirstName(String firstName)
    {
        this.firstName=firstName;
    }
    
    public String getlastName()
    {
       return this.lastName;
    }
    public void setlastName(String lastName)
    {
        this.lastName=lastName;
    }
    
    public String getcompany()
    {
        return this.company;
    }
    
    public void setcompany(String company)
    {
        this.company=company;
    }
    
    public String getemail()
    {
        return this.email;
    }
    
    public void setemail(String email)
    {
        this.email=email;
    }
    
    public pageReference save()
    {
        pageReference p=null;
        
        if(this.qp==null || !'yyyy'.equals(this.qp))
        {
            p=page.failure;
            p.getparameters().put('error','noParam');
            
        }
        else
        {
            try
            {
                Lead newlead= new Lead(LastName=this.lastName,firstName=this.firstName,company=this.company,email=this.email);
                insert newlead;
            }catch(Exception e)
            {
                p=page.failure;
                p.getParameters().put('error','noInsert');
            }
        }
        
        if(p==null)
        {
            p=page.success;
        }
        
        p.setRedirect(true);
        return p;
           
        }
}