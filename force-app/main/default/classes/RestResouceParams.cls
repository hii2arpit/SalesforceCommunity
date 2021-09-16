@RestResource(urlmapping='/myGetCall/*')
global class RestResouceParams 
{
    @HttpGet
    global static string callme()
    {
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        String name = request.params.get('empName');
        return name;
    }

}