public class WrapperControllerClone
{
    public list<wrapperaccount> wraplist;
    public list<wrapperaccount> getRecord()
    {
      if(wraplist==null)
      {
          wraplist=new list<wrapperaccount>();      
          List<OpportunityContactRole> acclist=[select OpportunityId,ContactId,IsPrimary,opportunity.name,Opportunity.Account.name from OpportunityContactRole];
          for(OpportunityContactRole ocr:acclist)
          { 
            wraplist.add(new wrapperaccount(ocr.opportunity.account,ocr.opportunity,ocr)); 
          }
      }
      return wraplist;
    }
    
    public pageReference clonerecord()
    {
        List<Account> selectedaccount=new List<Account>();
        List<opportunity> selectedOpportunity=new List<opportunity>();
        List<OpportunityContactRole> selectedopportunitycontactrole=new List<opportunitycontactrole>();
        for(wrapperaccount aa:getRecord())
        {
            if(aa.checkbox==true)
            {
                selectedaccount.add(aa.act);
                selectedOpportunity.add(aa.opp);
                selectedopportunitycontactrole.add(aa.oppcontactrole);
                 system.debug('@@Clone1'+selectedaccount);
                 system.debug('@@Clone2'+selectedopportunity);
                 system.debug('@@Clone3'+selectedopportunitycontactrole);
      
            Account accopy;
             for(Account a:selectedaccount)
             {
                 accopy=a.clone(false,true);
             }
             insert accopy;
             system.debug('@@test'+accopy);
             }
        }
        wraplist=null;
     return null;
    } 



    
   public class wrapperaccount
    {
        public account act{get;set;}
        public opportunity opp{get;set;}
        public opportunitycontactrole oppcontactrole{get;set;}
        public boolean checkbox{get;set;}
        public wrapperaccount(account a,opportunity o,OpportunityContactRole c)
        {
            this.act=a;
            this.opp=o;
            this.oppcontactrole=c;
            this.checkbox=false;
        }
    }
}