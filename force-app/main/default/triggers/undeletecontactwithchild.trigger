trigger undeletecontactwithchild on Contact (after undelete) 
{
    set<id> contid = new set<id>();
    list<Customer_Project__c> cpundelete = new list<Customer_Project__c>();
    for(contact con:Trigger.new)
    {
        contid.add(con.id);
    }
    
    cpundelete =[select id from Customer_Project__c where isdeleted=true and contact__c in:contid ALL ROWS];
    
    if(cpundelete.size()>0)
    {
        undelete cpundelete;
    }
    

}