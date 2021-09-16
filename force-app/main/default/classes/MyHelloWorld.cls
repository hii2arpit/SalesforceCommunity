public class MyHelloWorld
{
    public static void applyDiscount(Book__c[] books)
    {
        for(book__c b :books)
        {
            b.price__c*=0.9;
        }
    }
}