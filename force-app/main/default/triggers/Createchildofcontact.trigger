trigger Createchildofcontact on Contact (after insert) 
{
    list<Customer_Project__c> cplist = new list<Customer_Project__c>();
    for(contact con:trigger.new)
    {
        if(con.HasOptedOutOfEmail==true)
        {
            Customer_Project__c cp = new Customer_Project__c();
            cp.Name = con.lastname + 'Trigger';
            cp.Contact__c = con.id;
            cplist.add(cp);
        }
    }
insert cplist;
}