@isTest
public class VisibleSampleClassTest 
{
    static testmethod void test1()
    {
        VisibleSampleClass sample= new VisibleSampleClass();
        sample.recordnumber=100;
        sample.areaCode='(0144)';
        
        VisibleSampleClass.employee emp=new VisibleSampleClass.employee('Arpit Jain', '2702909');
        
        String s=sample.privatemethod(emp);
        system.assert(
            		 s.contains('(0144)')&&
            		 s.contains('Arpit Jain')&&
        			 s.contains('2702909'));              
    }
    
    static testmethod void test2()
    {
        try
        {
            throw new VisibleSampleClass.MyException('Throw From a test');
        }catch(VisibleSampleClass.MyException e)
        {}
    }
    
    static testmethod void test3()
    {
        VisibleSampleClass sample=new VisibleSampleClass();
        sample.publicmethod();
    }
}