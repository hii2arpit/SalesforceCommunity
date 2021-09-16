public class abc 
{
    public static void test()
    {
        String str='Hello';
        process(str);
        System.debug('-----'+str);
        system.assertEquals(str, 'Hellooooo');
    }  
    public static void process(String s) 
    {
       s='Change value';
     	 System.debug('-----'+s);

    }
}