public class JsonPassToFuture 
{
    public static void callme(String jsonString)
    {
        List<Account> acc= (list<account>)Json.deserialize(jsonString,List<Account>.class);
        
    }
}