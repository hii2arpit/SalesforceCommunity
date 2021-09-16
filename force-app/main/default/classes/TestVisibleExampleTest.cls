@isTest
public  class TestVisibleExampleTest
{
    @isTest static void test1()
    {
        integer i= TestVisibleExample.recordNumber;
        system.assertEquals(1,i);
    
    TestVisibleExample.updateRecord('Testing');
    }
}