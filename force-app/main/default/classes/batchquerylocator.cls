global class batchquerylocator implements Database.Batchable<sObject>
{
    global String query;
    
    Global batchquerylocator(String q)
    {
        query=q;
    }
    
  global Database.QueryLocator start(Database.BatchableContext bc)
  {
      return Database.getQueryLocator(query);
  }
  global void execute(Database.BatchableContext bc,List<sObject> scope)
  {
     delete scope;
  }
  global void finish(Database.BatchableContext bc)
  {
      
  }

}
/* Execute Anonymous
batchquerylocator bc=new batchquerylocator('select Id,name from account where name=\'Test\'');
Database.executeBatch(bc,2);
*/