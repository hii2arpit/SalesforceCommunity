trigger Opportunitytrigger on Opportunity (before insert)
{
   Opportuni.checkopp(Trigger.new);
}