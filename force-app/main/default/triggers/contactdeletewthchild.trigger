trigger contactdeletewthchild on Contact (before delete) 
{
    list<contact> delcp = new list<contact>();
    set<id> contid = new set<id>();
    list<Customer_Project__c> cp = new list<Customer_Project__c>();
   // delcp = [select id, (select id from Customer_Projects__r) from contact where id in: Trigger.old];
    
    for(contact con: Trigger.old)
    {
		contid.add(con.id);
    }
    cp =[select id from Customer_Project__c where contact__r.id in: contid];
    delete cp;
}