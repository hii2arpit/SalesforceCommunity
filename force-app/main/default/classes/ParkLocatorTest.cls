@isTest
public with sharing class ParkLocatorTest 
{
   @isTest static void testCallout()
    {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String contt='India'; 
        string[] result = ParkLocator.country(contt);
        // Verify that a fake result is returned
        
       System.assertEquals(new list<string>{'Rajasthan','Haryana','Punjab'}, result);
    }   
}