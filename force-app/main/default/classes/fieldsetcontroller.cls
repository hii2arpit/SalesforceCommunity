public class fieldsetcontroller 
{
    public String queryString{get;set;}
    public List<Account> accList{get;set;}
    public fieldsetcontroller ()
    {
        queryString = 'select id';
        for(Schema.FieldSetMember fld :SObjectType.Account.FieldSets.AccountField.getFields()) {
         queryString += ', ' + fld.getFieldPath();
        }
        System.debug('@@queryString-->'+queryString);
        queryString += ' from Account limit 5';
         
        acclist = Database.query(queryString);
    }
}