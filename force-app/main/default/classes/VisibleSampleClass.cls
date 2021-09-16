public class VisibleSampleClass 
{
    @TestVisible Private Integer recordnumber=0;
    @TestVisible Private String areaCode= '(415)';
    
    public Integer MaxRecords=1000;
    
    @TestVisible class employee
    {
        String fullName;
        String phone;

        @TestVisible employee(String s, String ph)
        {
            fullName=s;
            phone=ph;
        }        
    }
    
    @TestVisible private String privatemethod(employee e)
    {
       system.debug('I am Private');
        recordnumber++;
        system.debug(recordnumber);
        String phone= areaCode+''+e.phone;
        system.debug(phone);
        String s=e.fullName+'\'s phone number is' + phone;
        system.debug(s);
        return s;
    }
    
    public void publicMethod()
    {
        maxRecords++;
        system.debug('I am public');
    }
   
    @TestVisible private class MyException extends Exception{}       

}