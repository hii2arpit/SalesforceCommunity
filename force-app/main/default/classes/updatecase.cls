public with sharing class updatecase 
{
	public static void ucase(list<case> c)
	{   
		
		set<id> eqid=new set<id>();
		list<product2> prodlist=new list<product2>();
		list<case> newcase=new list<case>();
		list<Work_Part__c> wp=new list<Work_Part__c>();
		Decimal days;
		Integer day;
		
		//Create a set of product id.
		for(case clist:c)
		{
			for(Work_Part__c wlist:clist.Work_Parts__r)
			{
				eqid.add(wlist.Equipment__c);
			}
			system.debug('equpid-->>'+eqid);
		}
		
		//get the minimum life time from the all products
		prodlist=[select id,Name,Life_Time__c from product2 where id in:eqid];
		system.debug('testing productlist-->'+prodlist);
		for(Integer i=0;i<=prodlist.size();i++)
		{
			for(product2 lt:prodlist)
			{
				if(days==null)
				{
					days=lt.Life_Time__c;
				}
				else if(lt.Life_Time__c<days && lt.Life_Time__c!=null)
				{
					days=lt.Life_Time__c;
				}
			}			
		}
		day=(integer)days;
		system.debug('noumber of days-->>'+days);
		system.debug('noumber of days-->>'+day);
		
		//update and clone the case
		for(case ca:c)
		{
			ca.Subject='Test Subject';
			ca.Type='Routine';
			ca.status='New';
			if(day!=null)
			{
				ca.Due_Date__c=Date.Today().adddays(day);
			}
			newcase.add(ca.clone());
		}
		insert newcase;
		
		//link the work part with case
		for(case nc:newcase)
		{
			for(work_Part__c wpp:nc.work_Parts__r)
			{
				wpp.Case__c=nc.id;
				wp.add(wpp.clone());
			}
		}
		system.debug('workpart list-->>>'+wp);
		insert wp;
	}
}