trigger HelloWorldTrigger on Book__c (before Insert) 
{
Book__c[] books= Trigger.new;
hello.discount(books);
}