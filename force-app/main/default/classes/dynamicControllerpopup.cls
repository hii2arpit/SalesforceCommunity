public with sharing class dynamicControllerpopup {

public boolean first{get;set;}
public boolean second{get;set;}
    
    
       
    
    public PageReference AddRecord() {
        
        
       //Assign your own data to do this. for testing I just placed the dummy data.
       
       //Test Data
        MyWrapper oWrapp = new MyWrapper();
       // oWrapp.sName='Test1'; 
       // oWrapp.isFlag= false; 
        lstWrapper.add(oWrapp);
    
        return null;
    }


     public list<MyWrapper> lstWrapper {get;set;} 
      
     public dynamicControllerpopup(){
        this.lstWrapper = new list<MyWrapper>();  
        MyWrapper oWrapp = new MyWrapper();
         first=true;
        oWrapp.sName='Test'; 
        oWrapp.isFlag= true; 
        lstWrapper.add(oWrapp);
              
     } 
      public class MyWrapper{
          public string sName{ get;set;}
          public boolean isFlag{get;set;}
      }
      
      
      public pageReference test()
      {
          first=true;
          second=false;
          return null;
      }
      
      
      public pageReference test1()
      {
          first=false;
          second=true;
         return null;
      }
}