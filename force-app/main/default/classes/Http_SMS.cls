public class Http_SMS
{
    @future(callout=true)
    public static void sendSMS(Set<id> leadids)
    {
        list<lead> leads = [select id, phone from lead where id in:leadids];
        SMS_Data__c sms = [select name, password__c from SMS_Data__C limit 1];
        for(lead le:leads)
        {
            http p = new http();
            String url= 'http://global.smsindiahub.in/api/mt/SendSMS?';
            url = url + 'user='+sms.name+'&password='+sms.password__c;
            url = url+'&number='+le.phone;
            url = url+'&senderid=WEBSMS&channel=Normal&DCS=0&flashsms=0&text=Arpit+Jain+Salesforce+Developer+Testing+API';
            httpRequest request = new httpRequest();
            request.setEndpoint(url);
            request.setMethod('GET');
            httpResponse response = p.send(request);
            String body = response.getBody();
            le.Description = body +'==>>'+response;
        }
        
        update leads;
    }
}