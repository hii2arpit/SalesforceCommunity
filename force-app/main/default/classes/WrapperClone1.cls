public class WrapperClone1 
{
    public list<accountwrap> accwrap{get;set;}
    public list<opportunitywrap> opwrap{get;set;}
    public list<opportunityContactRole> oppconrole{get;set;}
    public map<id,list<Opportunity>> accoppmap{get;set;}
    public map<Id,list<opportunityContactRole>> oppconrolemap{get;set;}
    public map<id,list<opportunityContactRole>> mapclone{get;set;}
    public list<opportunity> ocr{get;set;}
    Public list<accountwrap> awrap{get;set;}
    Public list<accountwrap> awrapclone{get;set;}
    Public list<Account> acc{get;set;}
    Public list<opportunity> oppor{get;set;}
    Public list<opportunityContactRole> oppcontrole{get;set;}
    //Constructor   
    public WrapperClone1()
    {
        awrap=new list<accountwrap>();
        awrapclone=new list<accountwrap>();
        acc=new list<Account>();
        oppor=new list<opportunity>();
        oppcontrole=new list<opportunityContactRole>();
        ocr=new list<opportunity>();
        oppconrole=new list<opportunityContactRole>(); 
        accwrap=new list<accountwrap>(); 
        opwrap=new list<opportunitywrap>();     
        accoppmap=new map<Id,list<Opportunity>>();
        oppconrolemap=new map<Id,list<opportunityContactRole>>();
        mapclone=new map<id,list<opportunityContactRole>>();
    }
    
    //Method for getting record
    public list<accountwrap> getrecord()
    { 
        list<Account> ac=[Select Id,Name,(Select Id,Name,AccountId from opportunities) from Account];
        for(Account aa:ac)
        {
          accoppmap.put(aa.id,aa.opportunities);
        }
        
        list<opportunity> oppvalue=new list<opportunity>();
        for(list<opportunity> opp:accoppmap.values())
        {
            for(opportunity o:opp)
            {
                oppvalue.add(o);
            }
        }
        
        list<Opportunity> ocr=[Select Name,(select OpportunityId,ContactId,Contact.Name,IsPrimary from OpportunityContactRoles) from opportunity where id IN:oppvalue];
        for(opportunity o:ocr)
        {                    
            oppconrolemap.put(o.id,o.OpportunityContactRoles);
        }   
        
        for(Account amap:ac)
        {
            accwrap.add(new accountwrap(amap,oppconrolemap));
        }
        return accwrap;
    }
    
    //Method for Cloning the records
    public pageReference clonerecord()
    {
       //Check the checkbox is true or not
        for(accountwrap aa:accwrap)
        {
          for(opportunitywrap o:aa.oppwrap)
          {
            for(oppcontactrolewrap oc:o.ocrwrap)
            {
              if(oc.b==true)
              {
               awrap.add(aa);
              }
            }
          }
        }
        
        for(accountwrap a:awrap)
        {
            for(opportunitywrap o:a.oppwrap)
            {
                for(opportunity oo:ocr)
                {
                    if(oo.id==o.opp.id)
                    {
                        mapclone.put(o.opp.id,oo.OpportunityContactRoles);
                    }
                }
                awrapclone.add(new accountwrap(a.acc.clone(),mapclone));
            }
        
        }
        
        //Account Clone
        for(accountwrap a:awrapclone)
        {
          acc.add(a.acc);
        }
        insert acc; 
        system.debug('@@accountinsertNew-->'+acc);
        
        /*
        //Opportunity Clone
        for(accountwrap a:awrapclone)
        {
            for(opportunitywrap orw:a.oppwrap)
            {
                orw.opp.accountId=a.acc.id;
                for(Opportunity o:ocr)
                {
                    for(opportunityContactRole opcr:o.opportunityContactRoles)
                    {
                        for(oppcontactrolewrap oppcr:orw.ocrwrap)
                        {
                            if(opcr.id==oppcr.ocr.id)
                            {
                                oppconrole.add(opcr);
                            }
                        }
                    }
                }
                opwrap.add(new opportunitywrap(orw.opp.clone(),oppconrole));
            }
        }
        for(opportunitywrap op:opwrap)
        {
        oppor.add(op.opp);  
        }
        insert oppor;
        
        //OpportunityContactRole Clone
        for(opportunitywrap o:opwrap)
            {
                for(oppcontactrolewrap opprole:o.ocrwrap)
                {
                    opportunityContactRole oc=new opportunityContactRole();
                    oc=opprole.ocr.clone();
                    oc.opportunityId=O.Opp.id;
                    oppcontrole.add(oc); 
                }
            }
        insert oppcontrole;*/
        return null;
    }   

        //Account Wrapper
        public class accountwrap
        {
            public Account acc{get;set;}
            public List<opportunitywrap> oppwrap{get;set;}
            public accountwrap(account a,map<Id,list<opportunityContactRole>> oppconrolemap)
            {
                this.acc=a;
                oppwrap = new list<opportunitywrap>();
                for(opportunity opp: a.opportunities)
                {
                    oppwrap.add(new opportunitywrap( opp,oppconrolemap.get(opp.id)));
                }               
            }
        }
        //Opportunity Wrapper
        public class opportunitywrap
        {
            public opportunity opp{get;set;}
            public List<oppcontactrolewrap> ocrwrap{get;set;}
            public opportunitywrap(opportunity o,List<opportunityContactRole> ocontrole)
            {
                this.opp=o;
                ocrwrap = new List<oppcontactrolewrap>();
               
                for(opportunityContactRole ocr:ocontrole)
                {
                    ocrwrap.add(new oppcontactrolewrap(ocr));
                }
            }
        }
        //OpportunityContactRole Wrapper
        public class oppcontactrolewrap
        {
            public OpportunityContactRole ocr{get;set;}
            public boolean b{get;set;}
            public oppcontactrolewrap(OpportunityContactRole cr)
            {
                this.ocr=cr;
                this.b= false;
            }
        }
}