trigger accountupdate on Opportunity (after insert,after delete) 
{

list<opportunity> opp=new list<opportunity>();
list<account> acc=new list<account>();
list<account> upacc=new list<account>();
set<Id> accid=new set<Id>();

if(trigger.isInsert)
{
	for(opportunity o:Trigger.new)
	{
		accid.add(o.accountid);
	}
    
    acc=[select id,name,count__c,(select id,name,accountid from opportunities) from account where id IN:accid]; 
    Integer c=0;
    for(account a:acc)
    {
    	if(a.opportunities.size()>0)
    	{
	    	for(opportunity o:a.opportunities)
	    	{
	    		c++;
	    	}
    	}
    	a.count__c=c;
    }
    update acc;
}

if(trigger.isDelete)
{
	for(opportunity o:Trigger.old)
	{
		accid.add(o.accountid);
	}
    
    acc=[select id,name,count__c,(select id,name,accountid from opportunities) from account where id IN:accid]; 
    Integer c=0;
    for(account a:acc)
    {
    	if(a.opportunities.size()>0)
    	{
	    	for(opportunity o:a.opportunities)
	    	{
	    		c++;
	    	}
    	}
    	a.count__c=c;
    }
    update acc;
}
}