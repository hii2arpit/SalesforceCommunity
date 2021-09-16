public class DynamicSObjectCreation 
{
    public static sobject createobject(String typeName)
    {
        Schema.SObjectType targetType= Schema.getGlobalDescribe().get(typeName);
        if(targetType==null)
        {
            System.debug('Err');
        }
        return targetType.newsobject();
    }

}