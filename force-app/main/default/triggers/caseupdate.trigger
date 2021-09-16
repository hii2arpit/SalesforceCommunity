trigger caseupdate on Case (After update)
{
	list<case> caselist=new list<case>();
	list<case> newCaseList=new list<case>();
	system.debug('sizeoftriggernew-->'+Trigger.new.size());
	
	//list of records using trigger.new
	caselist=[select id,Vehicle__c,Status,Contactid,Type,Priority,Origin,Description,(select id,Equipment__c from Work_Parts__r) from case where id IN:Trigger.new];
	system.debug('caselist-->>'+caselist.size());
	
	for(Case ca:caselist)
	{
		if(Trigger.oldMap.get(ca.id).status!='closed' && Trigger.newMap.get(ca.id).status=='closed' && Trigger.newMap.get(ca.id).Type=='Repair')
		{
			newCaseList.add(ca);
		}
		system.debug('updatedrecord-->>'+newCaseList.size());
	}
	//calling helper class method
	updatecase.ucase(newCaseList);
}