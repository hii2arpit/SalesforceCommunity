global class batchclass implements Database.Batchable<Account>
{
	global Iterable<Account> start(Database.batchableContext info)
	{
		return new foo();
	}
	global void execute(Database.BatchableContext info,List<Account> scope)
	{
		List<Account> accsToUpdate=new List<Account>();
		for(Account a:scope)
		{
			a.Name='true';
			a.NumberofEmployees=69;
			accsToUpdate.add(a);
		}
		update accsToUpdate;
	}
	global void finish(Database.batchableContext info)
	{
		
	}
}