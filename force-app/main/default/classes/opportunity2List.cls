public class opportunity2List
{
 public ApexPages.StandardsetController setcon
 {
     get
     {
         if(setcon==null)
         {
             setcon= new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Name,CloseDate FROM Opportunity]));
         }
                return setcon;
              
     }    
         set;
 }
 
    public List<Opportunity> getopportunity()
     {
     return (List<Opportunity>)setcon.getRecords();
     }
}