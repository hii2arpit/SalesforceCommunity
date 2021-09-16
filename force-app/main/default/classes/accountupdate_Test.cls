@isTest
public with sharing class accountupdate_Test 
{
    public static testmethod void main()
    {
 	list<Account> acclist = new list<Account>();
    list<opportunity>opplist=new list<opportunity>();
    list<opportunity>oplist=new list<opportunity>();	   
   
    //Account Creation
        for (Integer i=1; i<=2; i++)
        {
            Account a=new Account(Name='testAcc'+i);
            acclist.add(a);
        }
    	insert acclist;

	    //Opportunity Cretion
	    for(Integer i=1;i<=10;i++)
	    { 
	        if(i<=5)
	        {
	            Opportunity o=new  Opportunity(Name='OppTest'+i,Accountid=acclist[0].id, StageName='Reserved',CloseDate=Date.today());
	            opplist.add(o);
	        }
	        else 
	        {
	            Opportunity o=new  Opportunity(Name='OppTest'+i,Accountid=acclist[1].id, StageName='Reserved',CloseDate=Date.today());
	            opplist.add(o);
	        }
	    }
    
	    test.startTest();
	    insert OppList;
	    system.assertEquals(10,opplist.size());
		oplist=[Select id,Name,Accountid from opportunity where accountid=:acclist[0].id];
		delete oplist[0];
		test.stopTest();
	}
}