public class scheduleApexApiCall implements schedulable
{
    public void execute(SchedulableContext sc)
    {
        scheduleApexApiCall.callme();
    }
    
    @future(Callout=true)
    public static void callme()
    {
        list<opportunity> scope = [select id, INRPrice__c, Amount from opportunity];
        String url = 'http://apilayer.net/api/live?access_key=2a4d3255f1139f496ba149d7b4b55a16&CURRENCIES=INR&source=USD&format=1';
        http p = new http();
        httpRequest request = new httpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = p.send(request);
        String result = response.getBody();
        System.JSONParser jp = JSON.createParser(result);
        Decimal price = 0;
        while(jp.nextToken()!=null)
        {
            System.debug('Condition match...'+jp.getText());
            if(jp.getText() == 'USDINR')
            {
                System.debug('Condition match...');
                jp.nextToken();
                
                price = (Decimal)jp.getDecimalValue();
                System.debug('Price.........'+price);
            }
        }

        for(Opportunity op: scope)
        {
            op.INRPrice__c =  op.Amount*price;
        }

        update scope;
   
        
    }
    

}