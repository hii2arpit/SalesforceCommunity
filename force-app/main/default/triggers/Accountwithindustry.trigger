trigger Accountwithindustry on Account (before insert) 
{
    for(account ac: Trigger.new)
    {
        if( ac.industry=='Education')
            {
                ac.addError('We are not working with Education Industry');
            }
    }
}