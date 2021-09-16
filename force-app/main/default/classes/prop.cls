public class prop 
{
    public static integer staticmember;
    public integer nonstaticmember;
    
    public static integer staticprop
    {
        get
        {
            return staticmember;
        }
        set;
        
    }
    public integer nonstaticprop
    {
        get
        {
         return nonstaticmember;   
        }
        
        set;
    }

}