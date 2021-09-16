public class Http_InternetProvider_Location 
{
    public string xmlString {get; set;}
    public string ipaddress {get; set;}
    public map<String,Object> resultMap{get; set;}
    
    public void traceMe()
    {
        system.debug('Testing................'+ipaddress);
        String url='http://xml.utrace.de?query='+ipaddress;
        http p = new http();
        httpRequest request = new httpRequest();
        request.setEndpoint(url);
        request.setMethod('GET'); 
        httpResponse response = p.send(request);
        system.debug('response................'+response);
        xmlString = ' '+response.getBody();
        resultMap = new map<String, Object>();
        Dom.Document doc = new Dom.Document();
        doc.load(xmlString);
        Dom.XmlNode root = doc.getRootElement();
        list<Dom.XmlNode> childs = root.getChildElements();
        for(Dom.XmlNode c:childs[0].getChildElements())
        {
            resultMap.put(c.getName(), c.getText());   
        }
        
    }
    

}