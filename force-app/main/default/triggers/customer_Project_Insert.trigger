trigger customer_Project_Insert on Customer_Project__c (before insert, before update) 
{
    list<opportunity> opplist = new list<opportunity>();
    opportunity opp = new opportunity();
    for(Customer_Project__c cp: Trigger.new)
    {
        if(cp.Opportunity__c != null && cp.Status__c == 'Active')
        {
            opp = [select id, Active_Customer_project__c from opportunity where id =: cp.Opportunity__c];
            opp.Active_Customer_project__c =True;
            opplist.add(opp);
        }
    }
    update opplist;

}