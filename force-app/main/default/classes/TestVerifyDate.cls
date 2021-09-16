/* Test Clas
*/
@isTest
Public class TestVerifyDate
{
	public static testmethod void main()
	{
		Date d=Date.Today()+10;
		Date d2=Date.Today()+30;
		VerifyDate.CheckDates(d,d2);
	}
    public static testmethod void main1()
	{
		Date d=Date.Today()+60;
		Date d2=Date.Today()+10;
		VerifyDate.CheckDates(d,d2);
	}
	public static testmethod void main2()
	{
		Date d=Date.Today();
		Date d2=Date.Today()+40;
		VerifyDate.CheckDates(d,d2);
	}
}