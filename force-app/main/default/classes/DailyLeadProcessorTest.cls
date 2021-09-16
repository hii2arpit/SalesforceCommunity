@isTest
public class DailyLeadProcessorTest 
{
     public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void leadupdate()
    {
        list<lead> testlead = new list<lead>();
        
        for(integer i =0; i<200; i++)
        {
            testlead.add(new lead(lastname='test'+i, company='UHCL'));
        }
        insert testlead;
        
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',CRON_EXP,new DailyLeadProcessor());  
        
        list<lead> checklist = [select id from lead where leadsource ='Dreamforce'];
        System.assertEquals(0, checklist.size(), 'lead source not updated');
         Test.stopTest();
        
        list<lead> updatedchecklist = [select id from lead where leadsource ='Dreamforce'];
        System.assertEquals(200, updatedchecklist.size(), 'lead source updated');
    }

}