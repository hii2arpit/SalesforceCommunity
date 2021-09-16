trigger Lead_sms on Lead (after insert)
{
    if(Trigger.isAfter && trigger.isInsert)
    {
       Map<id,lead> newmap = Trigger.newMap;
        set<id> leadid = newmap.keySet(); 
         Http_sms.sendSMS(leadid);
      
    }

}