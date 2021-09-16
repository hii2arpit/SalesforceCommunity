trigger ContactAfterInsert on Contact (after insert)
{
    List<contact> li= new list<contact>();
    for(contact con: Trigger.new)
    {
        contact c= new contact(id=con.id, HasOptedOutOfEmail=True, Phone='9680404163');
        li.add(c);
    }
    update li;

}