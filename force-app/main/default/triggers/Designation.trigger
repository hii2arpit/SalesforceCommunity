trigger Designation on Top_X_Designation__c (after insert) 
{
    map<id, list<Top_X_Designation__c >> desgmaptrue = new map<id, list<Top_X_Designation__c>>();
    map<id, list<Top_X_Designation__c >> desgmapfalse = new map<id, list<Top_X_Designation__c>>();
    set<id> oppid = new set<id>();
    list<opportunity> opplist = new list<opportunity>();
    
    if(Trigger.isInsert)
    {
        for(Top_X_Designation__c des:Trigger.new)
        {
            if(String.isNotblank(des.Opportunity__c))
            {
                if((des.Type__c =='Contract Flow Down' || des.Type__c =='Handoff') && des.Document_Attached__c == true)
                {
                    if(!desgmaptrue.containsKey(des.Opportunity__c))
                    {
                        desgmaptrue.put(des.Opportunity__c, new list<Top_X_Designation__c>());
                    }
                    desgmaptrue.get(des.opportunity__c).add(des);
                    oppid.add(des.opportunity__c);
                }
                else
                {
                    System.debug('check else....................................');
                    if(!desgmapfalse.containsKey(des.Opportunity__c))
                    {
                        desgmapfalse.put(des.Opportunity__c, new list<Top_X_Designation__c>());
                        System.debug('check else....................................123');
                    }
                    desgmapfalse.get(des.opportunity__c).add(des);
                    System.debug('check else....................................456');
                    oppid.add(des.opportunity__c);
                    
                }
            }
        }
    }
    
		if(oppid.size()>0)
        {
			opplist = [select id, Handoff__c from opportunity where id IN: oppid];
			for(opportunity o:opplist)
            {
                if(desgmaptrue.containsKey(o.id))
                {
                    o.Handoff__c = 'Yes';
                }
                if(desgmapfalse.containsKey(o.Id))
                {
                    System.debug('inside condition..............');
                    o.Handoff__c = 'No';
                }                
            }
            update opplist;
        }

}