public class WrapperController
{
  Public list<wrapperaccount> acctlist;
    
    public List<wrapperaccount> getAccount()
    {
        if(acctlist==null)
        {
          acctlist=new List<wrapperaccount>();
          list<account> aa=[Select name from account];
          for(Integer i=0;i<aa.size();i++)
          {
           acctlist.add(new wrapperaccount(aa[i]));
          }
        }
        return acctlist;
    }
    public pageReference deleteaccount()
    {
        List<Account> selectedaccount=new List<Account>();
        for(wrapperaccount aa:getAccount())
        {
            if(aa.checkbox==true)
            {
                selectedaccount.add(aa.act);
            }
        }
        for(account act:selectedaccount)
        {
            delete act;
        }
        acctList=null;
        return null;
    } 
   public class wrapperaccount
    {
        public account act{get;set;}
        public boolean checkbox{get;set;}
        public wrapperaccount(account a)
        {
            act=a;
            checkbox=false;
        }
    }
}