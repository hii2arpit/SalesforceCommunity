@isTest
public class DynamicSObjectCreationTest 
{
  static testmethod void testobjectCreation()
  {
      String typeName='Account';
      String acctname='Dynamic';
          Account a= (Account)DynamicsobjectCreation.createobject(typeName);
      system.assertEquals(typeName, String.valueOf(a.getsobjectType()));
      a.Name=acctName;
      insert a;
      Account[] b=[SELECT Name FROM Account WHERE Name= :acctName];
      system.assert(b.size() > 0);
      system.debug(b);
  }
       
}