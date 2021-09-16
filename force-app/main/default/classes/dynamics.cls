public class dynamics
{
    public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    public String selectedObject{get;
    set{
            this.selectedobject=value;
            rightvalues.clear();
            leftvalues.clear();
            Schema.SObjectType ObjectSchema = schemaMap.get(selectedObject);
            Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
            for (String fieldName: fieldMap.keySet()) 
            {  
             leftvalues.add(fieldName); 
            }
    }} 
    Public List<string> leftselected{get;set;}
    Public List<string> rightselected{get;set;}
    Set<string> leftvalues = new Set<string>();
    Set<string> rightvalues = new Set<string>();
    public string selectedfield{get;set;}
    public Integer querylimit{get;set;}
    public String selectedOrder{get;set;}
    public string selectedfilterfield{get;set;}
    public string filtertype{get;set;}

        Public dynamics()
        {   
            leftselected = new List<String>();
            rightselected = new List<String>();
        }
        
        public List<SelectOption> getObjectNames() 
        {
            List<SelectOption> objNames = new List<SelectOption>();
            List<String> entities = new List<String>(schemaMap.keySet());
            entities.sort();
            objnames.add(new selectoption ('--none--','--none--'));
            for(String name : entities)
            {
                objNames.add(new SelectOption(name,name));
            }            
            return objNames; 
        }
        
        public List<SelectOption> getFieldNames()
        {
            List<SelectOption> options1 = new List<SelectOption>();
            List<string> tempList = new List<String>();
            tempList.addAll(leftvalues);
            tempList.sort();
            for(String s : tempList)
            {
                system.debug('==>G '+s);
                options1.add(new SelectOption(s,s));
            }
            
            return options1;
        }
        
         public PageReference selectclick()
        { 
            system.debug('Gopal-'+leftselected);
           for(String s : leftselected)
            {
            system.debug('-->'+selectedfield);
              selectedfield=s;
              
            }
         system.debug('@@@@selectedfield'+selectedfield);
            return null;
        }
        
        public PageReference filtervalue() 
        {
        return null;
        }
        
}