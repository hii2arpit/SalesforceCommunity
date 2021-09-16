@isTest
public with sharing class accountoppcontdelete_Test 
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
    	
		//Contact Creation
		Contact con=new contact(FirstName='Test',LastName='Class',accountid=acclist[0].id,Email='testclass@apex.com',Phone='012362516');
		insert con;
		
	    //Opportunity Cretion
	    Opportunity o=new  Opportunity(Name='OppTest',Accountid=acclist[0].id, StageName='Reserved',CloseDate=Date.today());
	    opplist.add(o);
	    insert OppList;
	    
	    //opportunity Contact Role
	    opportunitycontactrole ocr=new opportunitycontactrole(ContactId=con.id,OpportunityId=opplist[0].id,Role='Business User');
	    insert ocr;
	    
	    list<opportunitycontactrole> ocrlist=[select contactid,opportunityid,Role from opportunitycontactrole where id=:ocr.id];
    	system.debug('listsize--==>>>'+ocrlist.size());
	    
       try
    	{
    		database.Deleteresult[] result=database.delete(acclist,false);
    		system.debug('resultvalue-->>'+result);
    	}
      catch(Exception e)
   		{
   	    	system.debug('error'+e);
    	}
     
     List<Account> leftaccount = [SELECT Id, Name FROM Account WHERE Id IN:acclist];
   	 system.assertEquals(1,leftaccount.size());   
     
	}
}