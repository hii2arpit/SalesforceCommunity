public with sharing class AnimalLocator
{
    public static String getAnimalNameById(Integer idd)
    {
        string animalvalue='';
		Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+idd);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
       if (response.getStatusCode() == 200) 
       {
           // Deserializes the JSON string into collections of primitive data types.
           Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
           system.debug('result map-->'+results);
           // Cast the values in the 'animals' key as a list
           map<string,Object> animals = (map<string,Object>) results.get('animal');
           System.debug('Received the following animals:'+animals);
           animalvalue=(string) animals.get('name');
           system.debug('name value-->'+animalvalue);
       }
        return animalvalue;
	}
}