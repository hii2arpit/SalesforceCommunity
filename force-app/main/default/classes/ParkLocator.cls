public with sharing class ParkLocator 
{
	public static string[] country(string cont)
	{
		ParkService.ParksImplPort park= new ParkService.ParksImplPort();
		return park.byCountry(cont);
		 
	}    
}