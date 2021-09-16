public class Http_Weather_API 
{
    public string city {get; set;}
    public string apikey {get; set;}
    public string JsonResult {get; set;}
    
    public void getWeather()
    {
     Map<String,Weather__C> weathermap= Weather__C.getAll();
     Weather__c ws = weathermap.get('Key');
     system.debug('weather Key------------->'+ws.Key__C);
     String url ='http://api.worldweatheronline.com/premium/v1/weather.ashx?';
     url = url+'&q='+city+'&num_of_days=1&key='+ws.Key__C;
        http p = new http();
        httpRequest request = new httpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        httpResponse response = p.send(request);
        JsonResult = response.getBody();
        
    }
}