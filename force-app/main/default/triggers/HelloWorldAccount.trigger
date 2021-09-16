trigger HelloWorldAccount on Account (before insert, before update) 
{
    if(Trigger.isInsert || Trigger.isUpdate)
    {
            UpdateHelloWorld.updateaccount(Trigger.new);
    }

}