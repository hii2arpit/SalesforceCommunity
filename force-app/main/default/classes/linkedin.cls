public with sharing class linkedin 
{
    public String code{set; get;}
    public String accessToken{get; set;}
    public String expireTime{get; set;}
        public String FirstName{get; set;}
        public String LastName{get; set;}
        public String ProfileURL{get; set;}
        public String ProfileId{get; set;}

    public pageReference readCode()
    {
         Map<String, Box__c> mybox = Box__c.getAll();
        Box__c b = myBox.get('Linkedin');
        
//        Box__c b = Box__c.getValues('Linkedin');
        system.debug('client id......'+b.ClientId__c);
        String scope = 'r_liteprofile%20r_emailaddress%20w_member_social';
        String url = 'https://www.linkedin.com/oauth/v2/authorization?';
        url = url+'response_type=code&client_id='+b.ClientId__c;
        url	= url+'&redirect_uri='+b.redirectUrl__c+'&scope='+scope;
        System.debug('URL ---- '+url);
        PageReference p = new PageReference(url);
        return p;
        
    }

    public void requestToken()
    {
      //  Box__c b = Box__c.getValues('Linkedin');
        code = ApexPages.currentpage().getParameters().get('code');
        System.debug('code ---- '+code);
        Map<String, Box__c> mybox = Box__c.getAll();
        Box__c b = myBox.get('Linkedin');
        
        String url = 'https://www.linkedin.com/oauth/v2/accessToken';
        String body = 'grant_type=authorization_code';
        body = body+'&code='+code;
        body = body+'&redirect_uri='+b.redirectUrl__c;
        body = body+'&client_id='+b.ClientId__c;
        body = body+'&client_secret='+b.ClientSecret__c;
        http p = new http();
        httpRequest request = new httpRequest();
        request.setEndpoint(url);
        request.setBody(body);
        request.setMethod('POST');
        HttpResponse response = p.send(request);
        String result = response.getBody();
        System.JSONParser jp = Json.createParser(result);

        while(jp.nextToken()!= null)
        {
            if(jp.getText() == 'access_token')
            {
                jp.nextToken();
                accessToken = jp.getText();
            }
            if(jp.getText() == 'expires_in')
            {
                jp.nextToken();
                expireTime = jp.getText();
            }
        }
        
        System.debug('access token........'+accesstoken);
    }
    
    public void fetchLinkedinDetails()
    {
        String url = 'https://api.linkedin.com/v2/me';
         System.debug('accessToken ---- '+accessToken);
        http p = new http();
        httpRequest request = new httpRequest();
        request.setEndpoint(url);
        request.setHeader('Authorization', 'Bearer '+accessToken);
        request.setHeader('Content-Type','application/json');
        request.setMethod('GET');
        HttpResponse response = p.send(request);
        String result = response.getBody();
         System.debug('response.getBody()........'+result);
        System.JSONParser jp = Json.createParser(result);

        while(jp.nextToken()!= null)
        {
            if(jp.getText() == 'firstName')
            {
                jp.nextToken();
                FirstName = jp.getText();
            }
            if(jp.getText() == 'lastName')
            {
                jp.nextToken();
                LastName = jp.getText();
            }
            if(jp.getText() == 'profilePicture')
            {
                jp.nextToken();
                ProfileURL = jp.getText();
            }
            if(jp.getText() == 'Id')
            {
                jp.nextToken();
                ProfileId = jp.getText();
            }
        }
        
        System.debug('access token........'+accesstoken);
    }
}