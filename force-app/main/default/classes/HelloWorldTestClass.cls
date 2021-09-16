@isTest
private class HelloWorldTestClass
{
    static testmethod void validateHelloWorld()
    {
      Book__C b= new Book__c(Name='Behind the cloud', Price__c=100);
      System.debug('price before insert new book:' + b.Price__c);
    
      insert b;
    
      b=[SELECT price__C FROM Book__c WHERE id =:b.id];
      System.debug('Price after trigger fired:' + b.Price__C);
    
    System.assertEquals(90,b.Price__c);
    }
}