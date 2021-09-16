public class ContactSearch 
{
     public static list<contact> searchForContacts(String name,String MPCode)
    {
          list<contact> cont= [SELECT Id,Name From contact where lastName=:name AND MailingPostalCode=:MPCode];
        for(contact c:cont)
        {
        system.debug(c.Name);
            }
         return cont;
    }
}