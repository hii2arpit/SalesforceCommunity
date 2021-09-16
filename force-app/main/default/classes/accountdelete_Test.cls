@isTest
public with sharing class accountdelete_Test 
{
    public static testmethod void main()
    {
    list<Account> acclist = new list<Account>();
    list<opportunity>opplist=new list<opportunity>();
   
    //Account Creation
        for (Integer i=1; i<=12; i++)
        {
            Account a=new Account(Name='testAcc'+i);
            acclist.add(a);
        }
    insert acclist;

    //Opportunity Cretion
    for(Integer i=1;i<=200;i++)
    { 
        if(i<=20)
        {
            Opportunity o=new  Opportunity(Name='OppTest'+i,Accountid=acclist[0].id, StageName='Reserved',CloseDate=Date.today());
            opplist.add(o);
        }
        else if(i>20&&i<=40)
        {
            Opportunity o=new  Opportunity(Name='OppTest'+i,Accountid=acclist[1].id, StageName='Reserved',CloseDate=Date.today());
            opplist.add(o);
        }
        else if(i>40&&i<=60)
        {
            Opportunity o=new  Opportunity(Name='OppTest'+i,Accountid=acclist[2].id, StageName='Reserved',CloseDate=Date.today());
            opplist.add(o);
        }
        else if(i>60&&i<=80)
        {
            Opportunity o=new  Opportunity(Name='OppTest'+i,Accountid=acclist[3].id, StageName='Reserved',CloseDate=Date.today());
            opplist.add(o);
        }
        else if(i>80&&i<=100)
        {
            Opportunity o=new  Opportunity(Name='OppTest'+i,Accountid=acclist[4].id, StageName='Reserved',CloseDate=Date.today());
            opplist.add(o);
        }
        else if(i>100&&i<=120)
        {
            Opportunity o=new  Opportunity(Name='OppTest'+i,Accountid=acclist[5].id, StageName='Reserved',CloseDate=Date.today());
            opplist.add(o);
        }
        else if(i>120&&i<=140)
        {
            Opportunity o=new  Opportunity(Name='OppTest'+i,Accountid=acclist[6].id, StageName='Reserved',CloseDate=Date.today());
            opplist.add(o);
        }
        else if(i>140&&i<=160)
        {
            Opportunity o=new  Opportunity(Name='OppTest'+i,Accountid=acclist[7].id, StageName='Reserved',CloseDate=Date.today());
            opplist.add(o);
        }
        else if(i>160&&i<=180)
        {
            Opportunity o=new  Opportunity(Name='OppTest'+i,Accountid=acclist[8].id, StageName='Reserved',CloseDate=Date.today());
            opplist.add(o);
        }
        else
        {
            Opportunity o=new  Opportunity(Name='OppTest'+i,Accountid=acclist[9].id, StageName='Reserved',CloseDate=Date.today());
            opplist.add(o);
        }
    }
    insert OppList;
	
	system.assertEquals(12,acclist.size());
/*	List<Account> accounts = [SELECT Id, Name FROM Account WHERE Id NOT IN (SELECT AccountId from Opportunity)];
	system.debug('accountwithoutopp-->'+accounts);
	test.startTest();
	delete accounts;
    List<Account> leftaccount = [SELECT Id, Name FROM Account WHERE Id IN:acclist];
    system.assertEquals(10,leftaccount.size());
*/
    try
    {
    	database.Deleteresult[] result=database.delete(acclist,false);
  /*  	for(Account acc : acclist)
  		{
    		system.debug('ACC=='+acc.id);
    	}
    	
    	for(database.Deleteresult d:result)
    	{
    	system.debug('error-->>>>'+d.getErrors());
    	} 
    	system.debug('sizelist-->>'+acclist.size()); */
    }
    catch(Exception e)
   	{
   	    system.debug('error'+e);
   	     	
    }
     List<Account> leftaccount2 = [SELECT Id, Name FROM Account WHERE Id IN:acclist];
    system.assertEquals(10,leftaccount2.size());   
    }
}