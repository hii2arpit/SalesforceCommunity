public class Http_PinCode 
{
    @future(callout=true)
    public static void afterInsert(Set<id> leadIds)
    {
        list<lead> newleads = [select id,Pincode__c,city from lead where id in: leadIds];
        for(lead l:newleads)
        {
            http p = new http();
            httpRequest request = new httpRequest();
            String url = 'https://api.postalpincode.in/postoffice/'+l.City;
            request.setEndpoint(url);
            request.setMethod('GET');
            HttpResponse response = p.send(request);
            String result = response.getBody();
            System.JsonParser Jp = Json.createParser(result);
            while(jp.nextToken()!=null)
            {
                if(jp.getText()=='PINCode')
                {
                    jp.nextToken();
                    l.PINCODE__c = jp.getText();
                }   
            }
          //  l.Description = result;
        }
        update newleads;
        
    }
    

}