public class Box_Authorize 
{
    public string code{get; set;}
    public String accessToken{get; set;}
    public String result{get; set;}
    
    public PageReference requestBoxCode()
    {
        Map<String, Box__c> mybox = Box__c.getAll();
        Box__c b = myBox.get('Box');
        
        String url = 'https://account.box.com/api/oauth2/authorize?';
        url = url+'response_type=code&client_id='+b.ClientId__c;
        url = url+'&redirect_uri='+b.redirectUrl__c+'&state=ArpitJain';
        PageReference p = new PageReference(url);
        return p;             
    }
    
    public void readRequestTokenFromURL()
    {
        code = Apexpages.currentPage().getParameters().get('code');
        System.debug('code........'+code);
        
        Map<String, Box__c> mybox = Box__c.getAll();
        Box__c b = myBox.get('Box');
        
        String requestToekUrl = 'https://api.box.com/oauth2/token';
        String body ='grant_type=authorization_code';
        body = body+'&client_id='+b.clientid__c;
        body = body+'&client_secret='+b.ClientSecret__c;
        body = body+ '&code='+code;
        http p = new http();
        httprequest Request = new httpRequest();
        Request.setEndpoint(requestToekUrl);
        request.setMethod('POST'); 
        request.setBody(body);
        HttpResponse response = p.send(request);
        String result = response.getBody();
        system.debug('access tokennnnnnnnnnn.......'+result);
        System.JsonParser jp = Json.CreateParser(result);
        while(jp.nextToken()!=null)
        {
            system.debug('access tokennnnnnnnnnn.......');
          if(jp.getText()=='access_token')
          {
              
            jp.nextToken();
            accessToken = jp.getText();
              system.debug('access token.......'+accessToken);
          }
       }
        createfolder();
    }
    
    public void createfolder()
    {
        String createFolderUrl = 'https://api.box.com/2.0/folders?';
        String body = '{"name": "Salesforce sub folder","parent": {"id": "115814694452"}}';
        http p = new http();
        httpRequest request = new httpRequest();
        request.setEndpoint(createFolderUrl);
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer '+accessToken);
        request.setBody(body);
        HttpResponse response = p.send(request);
        result = response.getBody();
        System.debug('Check result value.........'+result);
        
        
    }
}