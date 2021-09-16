@isTest
private class DataUtil 
{
    static testmethod void testloaddata()
    {
       		 List<sObject> li = Test.loadData(Account.sObjectType, 'testAccounts');        	
        	system.assert(li.size()==3);
            Account l1=(Account)li[0];
        	String acctName= l1.Name;
        	system.debug(acctName);
    }
}