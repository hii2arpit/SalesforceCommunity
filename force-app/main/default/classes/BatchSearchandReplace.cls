global class BatchSearchandReplace implements Database.Batchable<sObject>
{
    global final String query;
    global final String field;
    global final String value;
    
    global BatchSearchandReplace(String q,String f,String v)
    {
        query=q;
        field=f;
        value=v;
    }
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc,List<sObject> scope)
    {
        for(sObject s:scope)
        {
            s.put(Field,Value);
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc)
    {
        
    }
}