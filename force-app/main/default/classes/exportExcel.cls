public class exportExcel {
  
    public string header{get;set;}
      public string header1{get;set;}
   // public list<Account> acc {get;set;}
   public list<Book__c> book {get;set;}
     public string testing {get;set;}
    public list<string> str {get;set;}
    public exportExcel(){
        header = 'Name, firstName,Date,Industry,Test__c, Testing Data'; 
       // header = 'Unique Rec Ind, Activity,Doc Type,Company Code,Doc Date,Posting Date,Currency,Doc Header Text (char50),PIID,FAIN,Line Item Number (char03),Overall amount,Line Item Text (char50),Commitment Item (char14),Cost Center,Fund (char10),Functional Area (char16),Budget Period (char10),WBS (char24),GL Account,Business Area,Funds Center (char16),Vendor (char10),Per. of Perf. Start,Per. of Perf. End,PPA Exclude,Referenced Funds Reservation,Referenced Funds Reservation item,Sublevel Prefix,Agency Identifier,Allocation Transfer Agency Identifier,Beginning Period of Availability,Ending Period of Availability,Availability Type Code,Main Account,Subaccount,Purchasing Doc.,Purchasing Doc Item,Header Refrence,Document Category,Park/Post\r\n'; 
        header1 = 'Name, firstName,Date,Industry, Test__c,Test \n'; 
       /* acc =[select name,Industry,Test__c, (select firstName, Book_Date__c from contacts) from account];
        for(account a: acc){
           // String name = a.name;
            str.add(a.name);
        }
        testing = 'rfgh123-ppo1';
        for(account a: acc){
           a.Name = a.Name.replaceAll(',','-');
        } */
        
        book = [select id, name, Contact__r.firstname, Contact__r.account.Name from book__C];
    }
}