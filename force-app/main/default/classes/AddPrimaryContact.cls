public class AddPrimaryContact implements Queueable
{
    private contact contacts;
    private String state;
    
    public AddPrimaryContact(contact records, String s)
    {
        this.contacts = records;
        this.state = s;
    }
        public void execute(QueueableContext context)
    	{
            List<Account> accounts = [select id from account where billingState=:state Limit 200];
            List<contact> cont1 = new List<contact>();
               for(account a: accounts)
                {
                    contact con = contacts.clone();
                    con.AccountId = a.id;
                    cont1.add(con);
                }
            insert cont1;  
        }
}