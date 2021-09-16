trigger UpdateContact on Account (after Update) {
set<id> acct= new set<id>();
list<contact> con=new list<contact>();
    for(Account a: Trigger.new)
    {
        acct.add(a.Id);
    }
    
    list<Contact> ContactList=[SELECT Contact.Account.Name,Name FROM contact where accountid=:acct];
    system.debug('@@ContactList'+ContactList);
    contact cc=new contact();
    for(integer i=1;i<=ContactList.Size();i++)
    {
                cc.LastName=cc.Account.Name + i;
                con.add(cc);
    }
    update con;
    system.debug('@@Updated Contact'+con);
}