global class opportunityBatchConversion implements Database.Batchable<sobject>, Database.AllowsCallouts
{
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
         return Database.getQueryLocator('Select id, INRPrice__c, Amount from opportunity where createdDate = Today');
    }

    global void execute(Database.BatchableContext bc, List<Opportunity> scope)
    {
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

    global void finish(Database.BatchableContext bc)
    {


    }
}