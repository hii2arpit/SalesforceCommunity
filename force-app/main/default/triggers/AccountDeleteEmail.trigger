trigger AccountDeleteEmail on Account (after delete) 
{
    List<Messaging.email> email = new list<Messaging.email>();
    for(account a: Trigger.old)
    {
        Messaging.SingleEmailMessage email1 = new messaging.SingleEmailMessage();
        email1.setSubject('Account deleted');
        String body = '<h1> Dear Customer</h><p>Your account with account number'+ a.id;
        email1.setHtmlBody(body);
        email.add(email1);
        email1.setToAddresses(new String[]{a.email__c});
    }
	messaging.sendEmail(email);
}