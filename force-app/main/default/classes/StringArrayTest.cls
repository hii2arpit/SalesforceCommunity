public class StringArrayTest 
{
    public static List<String> generateStringArray(Integer n)
    {
        list<String> li= new list<String>();
        for(Integer i=0;i<n;i++)
        {
         li.add('Test '+ i);
         system.debug(li[i]);
        }
        system.debug(li);
        return li;
    }

}