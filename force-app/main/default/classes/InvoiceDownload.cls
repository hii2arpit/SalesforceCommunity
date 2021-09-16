global class InvoiceDownload 
{

        //Private List<Invoice__c> selected;
    private static String API_STATUS_NORMAL = '200';
    @AuraEnabled
    webservice static String getFilesToDownload()
    {
      List<Employment_Website__c> empIDs = [select Id from Employment_Website__c];
      List<id> ids = new List<id>();
      for(Employment_Website__c emp:empIDs)
      {
        ids.add(emp.id);
      }
      
      List<Employment_Website__c> selected = [select name from Employment_Website__c where id in : ids];
      Map<String,String> files = new Map<String,String>();
      for(Employment_Website__c inv : selected)
      {
          Blob pdf = new PageReference('/apex/Page2?id='+inv.Id).getContentAsPDF();
          files.put(inv.Name+'.pdf', EncodingUtil.base64Encode(pdf));
      }
        return JSON.serialize(files);
    }
}