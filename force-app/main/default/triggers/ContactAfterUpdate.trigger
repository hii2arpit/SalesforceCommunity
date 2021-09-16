trigger ContactAfterUpdate on Contact (after update)
{
    List<contact> li=new List<contact>();
    for(contact con:Trigger.new)
    {
         if(con.MobilePhone==null && con.Email==null)
        {
            contact c=new contact(Id= con.Id, MobilePhone='012120120', Email='arpit@applikontech.com');
            li.add(c);
        }
    }
    update li;

}