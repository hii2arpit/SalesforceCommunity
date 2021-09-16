public class RandomContactFactory 
{
    public static List<contact> generateRandomContacts(Integer numcont,String s)
    {
        List<contact>con=new List<contact>();
        for(Integer i=0;i<numcont;i++)
        {
            Contact c=new Contact(FirstName='Test'+i,LastName=s);
            con.add(c);
        }
        return con;        
    }

}