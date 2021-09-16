public class TestVisibleExample 
{
@TestVisible private static integer recordNumber=1;
    
    @TestVisible private static void updateRecord(String name)
    {
        system.debug(name);
    }
}