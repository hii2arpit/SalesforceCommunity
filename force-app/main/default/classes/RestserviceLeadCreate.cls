@RestResource(urlmapping='/leadcreate/*')
global class RestserviceLeadCreate 
{
    @HttpGet
    global static String create()
    {
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        String lastName = request.params.get('lastName');
        String firstname = request.params.get('firstName');
        String phone = request.params.get('phone');
        System.debug('----'+LastName+'----'+FirstName+'------'+Phone);
        System.JsonGenerator js = Json.createGenerator(true);
        js.writeStartObject();
        js.WriteFieldName('Status');
        try{
            lead le = new lead();
            le.lastName= lastName;
            le.firstname= firstname;
            le.phone = phone;
            le.company = 'TestRestAPI';
            insert le;
        js.WriteString('Success');
        js.writeStringfield('Id', le.id);
        }catch(Exception e)
        {
            js.WriteString('Failed');
            js.WriteStringField('Error',''+e.getTypeName());
            //System.debug(e);
        }
        js.WriteEndObject();
       string result = js.getAsString();
        return result;
    }
    
    @HttpPost
    global static String createlead(String lname, String fname, String Company)
    {
        dom.Document doc = new dom.Document();
        dom.XmlNode root = doc.createRootElement('Result', null, null);
        dom.XmlNode status = root.addChildElement('Status', null, null);
        
        try{
            lead l = new lead();
            l.FirstName = fname;
            l.LastName = lname;
            l.Company = company;
            insert l;
            status.addTextNode('Success'); 
            dom.XmlNode scode = root.addChildElement('code',null,null);
            scode.addTextNode('200');
        }catch(Exception e)
        {
            status.addTextNode('Failed'); 
            dom.XmlNode scode = root.addChildElement('code',null,null);
            scode.addTextNode('8888');
        }
        String result = doc.toXMLString();
        return result;
            }
}