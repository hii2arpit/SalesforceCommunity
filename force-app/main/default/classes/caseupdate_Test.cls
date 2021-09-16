@istest
public class caseupdate_Test 
{
    public static testmethod void main()
    {
        list<Case> clist=new list<case>();
        list<Work_Part__c> wplist=new list<Work_Part__c>();
        list<Vehicle__c> vlist=new list<Vehicle__c>();
        list<Product2> prod=new list<Product2>();
        
        //Create Vehicle 
        vlist.add(new Vehicle__c(Name='Car',Vehicle_Number__c='123456'));
        insert vlist;
        
        //Create Product
        prod.add(new Product2(Name='Break',Life_Time__c=50));
        prod.add(new Product2(Name='Oil',Life_Time__c=10));
        prod.add(new Product2(Name='type',Life_Time__c=20));
        prod.add(new Product2(Name='Mirror',Life_Time__c=30));
        prod.add(new Product2(Name='Glass',Life_Time__c=20));
        insert prod;
        
        //Create Case
        for(integer i=0;i<300;i++)
        {
            clist.add(new Case(type='service',Status='new',Origin='Phone',Subject='Test'+i,Due_Date__c=null,Vehicle__c=vlist[0].id));
        }
      
        insert clist;
        //Create Workpart
        wplist.add(new Work_Part__c(Case__c=clist[0].id,Equipment__c=prod[0].id));
        wplist.add(new Work_Part__c(Case__c=clist[0].id,Equipment__c=prod[1].id));
        wplist.add(new Work_Part__c(Case__c=clist[0].id,Equipment__c=prod[2].id));
        wplist.add(new Work_Part__c(Case__c=clist[1].id,Equipment__c=prod[3].id));
        wplist.add(new Work_Part__c(Case__c=clist[1].id,Equipment__c=prod[4].id));
        insert wplist;
        
        //Case Update
        for(Integer i=0;i<200;i++)
        {
        	clist[i].status='closed';
        }
        update clist;
        
        list<case> totalcase=new list<case>();
        totalcase=[select id from case];
        system.assertEquals(300,totalcase.size());
    }
    
    public static testmethod void main1()
    {
        list<Case> clist=new list<case>();
        list<Work_Part__c> wplist=new list<Work_Part__c>();
        list<Vehicle__c> vlist=new list<Vehicle__c>();
        list<Product2> prod=new list<Product2>();
        
        //Create Vehicle 
        vlist.add(new Vehicle__c(Name='Car',Vehicle_Number__c='123456'));
        insert vlist;
        
        //Create Product
        prod.add(new Product2(Name='Break',Life_Time__c=50));
        prod.add(new Product2(Name='Oil',Life_Time__c=10));
        prod.add(new Product2(Name='type',Life_Time__c=20));
        prod.add(new Product2(Name='Mirror',Life_Time__c=30));
        prod.add(new Product2(Name='Glass',Life_Time__c=20));
        insert prod;
        
        //Create Case
        for(integer i=1;i<=100;i++)
        {
           clist.add(new Case(type='repair',Status='New',Origin='Phone',Subject='Test'+i,Due_Date__c=null));
        }
        insert clist;
       
       //Create Workpart
        wplist.add(new Work_Part__c(Case__c=clist[0].id,Equipment__c=prod[0].id));
        wplist.add(new Work_Part__c(Case__c=clist[0].id,Equipment__c=prod[1].id));
        wplist.add(new Work_Part__c(Case__c=clist[0].id,Equipment__c=prod[2].id));
        wplist.add(new Work_Part__c(Case__c=clist[1].id,Equipment__c=prod[3].id));
        wplist.add(new Work_Part__c(Case__c=clist[1].id,Equipment__c=prod[4].id));
        insert wplist;
       
       //Case Update
        for(integer i=0;i<90;i++)
        {
        	clist[i].status='closed';
        }
        update clist;
        list<case>leftcase=new list<case>();
        leftcase=[select id,status from case where status='new'];
        system.assertEquals(100,leftcase.size()); 
    }
    
    public static testmethod void main2()
    {
        list<Case> clist=new list<case>();
        list<Work_Part__c> wplist=new list<Work_Part__c>();
        list<Vehicle__c> vlist=new list<Vehicle__c>();
        list<Product2> prod=new list<Product2>();
        
        //Create Vehicle 
        vlist.add(new Vehicle__c(Name='Car',Vehicle_Number__c='123456'));
        insert vlist;
        
        //Create Product
        prod.add(new Product2(Name='Break',Life_Time__c=50));
        prod.add(new Product2(Name='Oil',Life_Time__c=10));
        prod.add(new Product2(Name='type',Life_Time__c=20));
        prod.add(new Product2(Name='Mirror',Life_Time__c=30));
        prod.add(new Product2(Name='Glass',Life_Time__c=20));
        insert prod;
        
        //Create Case
        for(integer i=1;i<=100;i++)
        {
           clist.add(new Case(type='repair',Status='New',Origin='Phone',Subject='Test'+i,Due_Date__c=null));
        }
        insert clist;
       
       //Create Workpart
        wplist.add(new Work_Part__c(Case__c=clist[0].id,Equipment__c=prod[0].id));
        wplist.add(new Work_Part__c(Case__c=clist[0].id,Equipment__c=prod[1].id));
        wplist.add(new Work_Part__c(Case__c=clist[0].id,Equipment__c=prod[2].id));
        wplist.add(new Work_Part__c(Case__c=clist[1].id,Equipment__c=prod[3].id));
        wplist.add(new Work_Part__c(Case__c=clist[1].id,Equipment__c=prod[4].id));
        insert wplist;
       
        //Case Update
        for(integer i=0;i<90;i++)
        {
        	clist[i].status='Working';
        }
        update clist;
        list<case>totalcase=new list<case>();
        totalcase=[select id,status from case];
        system.assertEquals(100,totalcase.size()); 
    }
}