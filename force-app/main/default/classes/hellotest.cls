@isTest
public class hellotest
{
public static testmethod void validatehello()
    {
    Book__c b=new Book__c(Name='cloud',price__c=100);
    system.debug('price after insert the book'+ b.price__c);
    
    insert b;
    b=[SELECT price__c FROM Book__c WHERE id = :b.id];
    system.debug('price after trigger fired'+ b.price__c);
    system.assertEquals(90, b.price__c);
    }
}