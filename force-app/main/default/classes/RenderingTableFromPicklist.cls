Public class RenderingTableFromPicklist
{
    public Boolean countryhide{get;set;}
    public Boolean statehide{get;set;}
    public Boolean cityhide{get;set;}
    public Boolean actionstatushide{get;set;}
    public Boolean pageblockhide{get;set;}
    public string renderAs{get;set;}
    public string renderexcel{get;set;}
     
    public List<Account> acc{get;set;}
    public List<Account> filtercountrylist{get;set;}
    public List<Account> filterstatelist{get;set;}
    public List<Account> filtercitylist{get;set;}
    
    public Map<Id,Account> CountryMap{get;set;}
    public Map<Id,Account> StateMap{get;set;}
    public Map<id,Account> CityMap{get;set;}
    
    public list<string> selectedcountry{get;set;}
    public list<string> selectedstate{get;set;}
    public list<string> selectedcity{get;set;}
    
    //public list<selectoption> statename{get;set;}
    
    //Constructor
    public RenderingTableFromPicklist()
    {
    actionstatushide=true;
    countryhide=true;
    pageblockhide=true;
       // statename=new list<selectoption>();
         statehide=false;
         cityhide=false;
        filtercountrylist=new list<account>();
        filterstatelist=new list<account>();
        filtercitylist=new list<account>();
        
        acc=[SELECT name,accountnumber,Billingcountry,Billingstate,Billingcity, Today_Date__c, Unique_Record_Id__c From Account];
        CountryMap=new map<Id,Account>([Select BillingCountry from account]);
        system.debug('countymapvalue---->'+CountryMap);
        for(account a:CountryMap.values())
        {
            a.id=null;
            filtercountrylist.add(a);
            system.debug('Filtermapvalue---->'+filtercountrylist);
        }
        system.debug('Testing-->'+CountryMap.values());
    }
    
    //Pdf Download
    public void forceDownloadPDF()
    {
       actionstatushide=false;
        pageblockhide=false;
        renderAs = 'pdf';
        //renderexcel='application/vnd.ms-excel#AccountExport.xls';
     //setup a default file name
     
      string fileName = 'My_PDF_Report '+date.today()+'.pdf';
      Apexpages.currentPage().getHeaders().put('content-disposition', 'attachemnt; filename='+fileName);      
    }
    //Excel Download
    public void forceDownloadExcel()
    {
        actionstatushide=false;
        pageblockhide=false;
       // renderexcel='application/vnd.ms-excel#AccountExport.xls';
       renderexcel='application/ms-excel#AccountExport.xls';
    }
    
    //Doc Download
    public void forceDownloadDoc()
    {
        actionstatushide=false;
        pageblockhide=false;
        renderexcel='application/vnd.ms-excel#AccountExport.doc';
    }

       public PageReference SaveAsCSV() {
        //pb1=false;
        renderexcel='application/vnd.ms-excel#AccountReport.xls';
        return null;
    }
    
    
    // //Method which show the list of Country
    //  public List<selectoption> getcountryy()
    // {
  
    //     list<selectoption> countryname=new list<selectoption>();
    //     set<account> mapkey=new set<account>(filtercountrylist);
    //     system.debug('Acclist'+mapkey);
    //     countryname.add(new selectoption('All','All'));
    //     for(account s:mapkey)
    //     {
    //         if(s.BillingCountry!=null)
    //         {
    //         countryname.add(new selectoption(s.BillingCountry,s.BillingCountry));
    //         }
    //     }
    //     system.debug('testcountyname-->>>>>'+countryname);
      
    //     return countryname; 
    // }
  
    // //Method which show the list of State     
    //  public List<selectoption> getstate()
    //  {
       
    //     if(selectedcountry!=null)
    //     {
            
    //        list<selectoption> statename=new list<selectoption>();
    //        //StateMap=new map<Id,Account>([Select Billingstate from account]);
    //         system.debug('cont-->'+selectedcountry);
            
    //      /*   if(selectedcountry[0]!='All')
    //         {
    //            StateMap=new map<Id,Account>([Select Billingstate from account where Billingcountry In:selectedcountry]);
    //         }
    //         else
    //         {
    //            StateMap=new map<Id,Account>([Select Billingstate from account]); 
    //         } */
            
    //        StateMap=new map<Id,Account>([Select Billingstate from account where Billingcountry In:selectedcountry]);
           
    //        for(account a:StateMap.values())
    //        {
    //            a.id=null;
    //            filterstatelist.add(a);
    //        }
           
    //        system.debug('statemapvalues--'+statemap);
    //        set<Account> mapvalues=new set<Account>(filterstatelist);
    //        system.debug('statevalueslist---'+mapvalues);
    //        statename.add(new selectoption('All','All'));
           
    //        for(account a:mapvalues)
    //         {
    //            if(a.Billingstate!=null)
    //            {
    //            statename.add(new selectoption(a.Billingstate,a.Billingstate));
    //            }
    //         }
            
    //         filterstatelist.clear();
    //     return statename;  
    //    }
    // return null;
    // }
    

    // //Method which show the list of City
    //  public List<selectoption> getcity()
    // {
     
    //     if(selectedstate!=null)
    //     {
       
    //        list<selectoption> cityname=new list<selectoption>();
    //        //StateMap=new map<Id,Account>([Select Billingcity from account]);
    //        system.debug('statecity-->>'+selectedstate);
    //       /*  if(selectedstate[0]!='All')
    //         {
    //            CityMap=new map<Id,Account>([Select Billingcity from account where Billingstate In:selectedstate]);
    //         }
    //         else
    //         {
    //            CityMap=new map<Id,Account>([Select Billingcity from account where Billingcountry In:selectedcountry]);
    //         } */
           
    //        CityMap=new map<Id,Account>([Select Billingcity from account where Billingstate In:selectedstate]);
           
    //        for(account a:CityMap.values())
    //        {
    //            a.id=null;
    //            filtercitylist.add(a);
    //        }
    //        system.debug('citymapvalues--'+statemap);
    //        set<Account> mapvalues=new set<Account>(filtercitylist);
    //        system.debug('cityvalueslist---'+mapvalues);
    //        cityname.add(new selectoption('All','All'));
    //        for(account a:mapvalues)
    //         {
    //            if(a.Billingcity!=null)
    //            {
    //            cityname.add(new selectoption(a.Billingcity,a.Billingcity));
    //            }
    //         }
    //         filtercitylist.clear();
           
    //     return cityname; 
    //     }
    // return null;
    // }  
    
    
    
    // //Method which show the filer account When we select city
    // public void citylist()
    // {
     
    //     if(selectedcity[0]!='All')
    //      {
    //      acc=[SELECT name,accountnumber,Billingcountry,Billingstate,Billingcity From Account where Billingcountry In:selectedcountry AND Billingstate In:selectedstate AND Billingcity In:selectedcity];
    //      }
    //      else
    //      {
    //      acc=[SELECT name,accountnumber,Billingcountry,Billingstate,Billingcity From Account where  Billingcountry In:selectedcountry AND Billingstate In:selectedstate];
    //      }
    // }
    
    //  //Method which show the filer account When we select Country
    //  public void countrylist()
    //  {
    //   cityhide=false;

    //      if(selectedcountry[0]!='All')
    //      {
    //      statehide=true;
    //      acc=[SELECT name,accountnumber,Billingcountry,Billingstate,Billingcity From Account where Billingcountry In:selectedcountry];
    //      }
    //      else
    //      {
    //      statehide=false;
    //      acc=[SELECT name,accountnumber,Billingcountry,Billingstate,Billingcity From Account];
    //      }
    //  }
     
    //  //Method which show the filer account When we select state     
    //   public void statelist()
    //  {
    //     if(selectedstate[0]!='All')
    //      {
    //      cityhide=true;
    //      acc=[SELECT name,accountnumber,Billingcountry,Billingstate,Billingcity From Account where  Billingcountry In:selectedcountry AND Billingstate In:selectedstate];
    //      }
    //      else
    //      {
    //      cityhide=false;
    //      acc=[SELECT name,accountnumber,Billingcountry,Billingstate,Billingcity From Account where Billingcountry In:selectedcountry];
    //      }
    //  }
}