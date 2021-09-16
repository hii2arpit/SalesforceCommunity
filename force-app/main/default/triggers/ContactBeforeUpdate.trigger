trigger ContactBeforeUpdate on Contact (before update)
{
    for(contact c: Trigger.new)
    {
        c.phone='01127029090';
    }

}