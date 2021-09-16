trigger CreatePosition on Position__c (after insert) 
{
    List<Employment_Website__c> ew= new List<Employment_Website__c>();
    for(Position__c pos: Trigger.New)
    {
        if(pos.Functional_Area__c=='Finance' && pos.Travel_Required__c==true)
        {
            ew.add(new Employment_Website__c(
            Name='Trigger',
            Maximum_Budget__c=100,
            Price_Per_Post__c=20,
            Web_Address__c='trigger@salesforce.com'));
        }
    }
    insert ew;

}