trigger ContactBeforeTrigger on Contact (before insert, before update, after insert) 
{
    for(contact c: Trigger.new)
    {
        if(Trigger.isInsert && c.email==null)
            {
                    c.addError('Please enter email.');
            }
        
        else
        {
            c.addError('you can not update a record without email.');
        }
    }    

}