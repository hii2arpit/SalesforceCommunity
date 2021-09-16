global class UpdateAccountFields implements Database.Batchable<sobject>
{
    global final string Query;
    global final string Entity;
    global final string Field;
    global final string Value;
    
    global UpdateAccountFields(String q, String e, String f, String v)
    {
        Query=q;
        Entity=e;
        Field=f;
        Value=v;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sobject> scope)
    {
        for(Sobject s:scope)
        {
            s.put(Field,Value);
        }
        update scope;
    }
    
    global void finish(Database.BatchableContext BC)
    {
    }
}