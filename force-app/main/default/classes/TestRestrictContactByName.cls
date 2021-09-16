/* Test Class */

@isTest
public class TestRestrictContactByName
{
	public static testmethod void main()
	{
		//Create Account
		Account acc=new Account(Name='Test');
		insert acc;
		//Create Contact
		Contact con=new Contact(AccountId=acc.id,FirstName='Test',LastName='INVALIDNAME',Total_Leave__c=10);
		insert con;
	}
}