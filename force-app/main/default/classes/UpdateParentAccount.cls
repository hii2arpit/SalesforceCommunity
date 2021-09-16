public class UpdateParentAccount implements Queueable
{
    private list<account> parentaccounts;
    private ID parent;
    
    public UpdateParentAccount(List<Account> records, ID id)
    {
        this.parentaccounts = records;
        this.parent = id;
    }
    
    public void execute(QueueableContext context)
    {
        for(Account acc:parentaccounts)
        {
            acc.parentId = parent;
        }
        update parentaccounts;
    }
}