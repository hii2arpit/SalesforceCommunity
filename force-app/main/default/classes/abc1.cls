public class abc1 
{
    public static void one()
    {
        List<Integer> one= new List<Integer>();
        ref(one);
        System.assertEquals(one.size(),5);
        System.debug(one);
        
        List<Integer> two=new List<Integer>();
        reff(two);
        System.assertEquals(two.size(),1);
        System.debug(two);
    }
    
    public static void ref(List<Integer> m)
    {
        m.add(1);
        m.add(2);
        m.add(3);
        m.add(4);
        m.add(5);
    }
    public static void reff(List<Integer> m)
    {
        m.add(20);
        m= new List<Integer>{22,52,62,41,55};
    m.add(21);
            system.debug(m);
            }

}