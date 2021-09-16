public class objectController
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

        Public objectController()
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
        
        public List<SelectOption> getunSelectedValues()
        {
            List<SelectOption> options1 = new List<SelectOption>();
            List<string> tempList = new List<String>();
            tempList.addAll(leftvalues);
            tempList.sort();
            for(String s : tempList)
            {
                options1.add(new SelectOption(s,s));
            }
            
            return options1;
        }
        
        public PageReference selectclick()
        {
            rightselected.clear();
           // system.debug('@leftselected@'+leftselected);
           // system.debug('@rightselected@'+rightselected);
            for(String s : leftselected)
            {
                leftvalues.remove(s);
                system.debug('@@remove@@'+s);
                rightvalues.add(s);
            }
            return null;
            }
             
        public PageReference unselectclick()
        {
            leftselected.clear();
            //system.debug('@leftselected@'+leftselected);
            //system.debug('@rightselected@'+rightselected);
            for(String s : rightselected)
            {
                rightvalues.remove(s);
                leftvalues.add(s);
            }
            return null;
        }
         
         
        public List<SelectOption> getSelectedValues()
        {
            List<SelectOption> options1 = new List<SelectOption>();
            List<string> tempList = new List<String>();
            tempList.addAll(rightvalues);
            tempList.sort();
            for(String s : tempList)
            {
                options1.add(new SelectOption(s,s));
            }
            return options1;
        }     
}