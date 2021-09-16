@isTest
private class LeadProcessorTest 
{
    @testSetup 
    static void setup() 
    {
        List<lead> test = new list<lead>();
        
        for(Integer i=0;i<200;i++)
        {
            test.add(new lead(lastname = 'lead'+ i, company='UHCL'));
        }
        insert test;
    }
    
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
    }


}