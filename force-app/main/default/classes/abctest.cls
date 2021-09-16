@IsTest

public class abctest
{
	public static testmethod void abc()
	{
	list<User> u =[SELECT Id,Name from user where username='arpittrail@gmail.com'];
	system.RunAs(u[0])
		{
		// abc a1= new ab();
		// a1.one(5,6);
        //     system.assertEquals(30, 30);
        //     system.assertNotEquals(35, 30);
		}
	}
}