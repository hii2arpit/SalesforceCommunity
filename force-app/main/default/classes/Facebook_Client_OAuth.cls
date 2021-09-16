public class Facebook_Client_OAuth 
{
    public string accessToken {get; set;}
    public string result {get; set;}
    public Account acc;
    
    public PageReference getToken()
    {
        Box__c b = Box__c.getValues('Facebook');
        String url = 'https://graph.facebook.com/oauth/access_token?';
  		url = url+'client_id='+b.ClientId__c+'&client_secret='+b.ClientSecret__c+'&grant_type=client_credentials';
        http p = new http();
        httpRequest request = new httpRequest();
        request.setMethod('GET');
        request.setEndpoint(url);
        HttpResponse response = p.send(request);
        String result = response.getBody();
        System.JSONParser jp = Json.createParser(result);
        while(jp.nextToken()!=null)
        {
            if(jp.getText()=='access_token')
            {
                jp.nextToken();
                accessToken = jp.getText();
            }
        }
        getMyData();
        PageReference p1 = new PageReference('/'+acc.id);
        return p1;
    }
    
    public void getMyData()
    {
        http p = new http();
        HttpRequest request = new httpRequest();
        request.setEndpoint('https://graph.facebook.com/v7.0/100052841851608');
        request.setMethod('GET');
        request.setHeader('Authorization','Bearer '+accessToken);
        HttpResponse response = p.send(request);
        result = response.getBody();
        System.JSONParser jp = JSON.createParser(result);
        acc = new Account();
        while(jp.nextToken()!=null)
        {
            if(jp.getText()== 'name')
            {
                jp.nextToken();
                acc.name = jp.getText();
            }
            if(jp.getText()== 'id')
            {
                jp.nextToken();
                acc.Description = jp.getText()+'----Test';
            }
        }
        
        insert acc;
    }

}