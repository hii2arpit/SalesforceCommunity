@isTest
private class AnimalLocatorTest
{
     static testmethod  void testCallout() 
     {
         Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
         String result = AnimalLocator.getAnimalNameById(1);
         String expected = 'chicken';
         system.assertEquals(expected, result);
     }
}