public with sharing class DownloadAs_PDF_Excel_Doc {
    
    public List<Account> acct{get;set;}
    public string renderAsdoc{get;set;}
    public boolean pb1{get;set;}
    public string renderAsExcel{get;set;}
 
    public DownloadAs_PDF_Excel_Doc() {
        acct=[Select Name,BillingCountry,BillingState,BillingCity from Account];
        pb1=true;
    }
    
    //pdf generate
    public PageReference SaveAspdf() {
        pb1=false;
        renderAsdoc='pdf';
        //setup a default file name
        string fileName = 'Account Report Country State City '+date.today()+'.pdf';
        Apexpages.currentPage().getHeaders().put('content-disposition', 'attachemnt; filename='+fileName);
        return null;
    }

    //Save as Excel
    public PageReference SaveAsExcel() {
        pb1=false;
        renderAsExcel='application/vnd.ms-excel#Account Report.xls';
        return null;
    }
    
    // Save as word 
    public PageReference SaveAsWord() {
         pb1=false;
        renderAsExcel='application/vnd.ms-word#Account Report.doc';
        return null;
    }

// Save as CSV
   //Save as Excel
    public PageReference SaveAsCSV() {
        pb1=false;
        renderAsExcel='application/vnd.ms-excel#Account Report.csv';
        return null;
    }

}