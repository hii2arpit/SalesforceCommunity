public with sharing class QuotePageClass
{ 
    public String searchTerm {get; set;}
    
   
    
    public boolean showTax{get;set;}
    public decimal subtotal{get;set;}
    public decimal tax{get;set;}
    public string index {get; set;}
    public String searchTerm1 {get; set;}
    public String selectedContact {get; set;}
    public String selectedContact1 {get; set;}
    public contact cont{get;set;}
    public contact cont1{get;set;}
    public string mailingaaccount{get;set;}
    public string mailingemail{get;set;}
    public string mailingphone{get;set;}
    public string mailingaddress{get;set;}
    public string mailingaaccount1{get;set;}
    public string mailingemail1{get;set;}
    public string mailingphone1{get;set;}
    public string mailingaddress1{get;set;}
    public list<Quote> QuoteStatus{get;set;}
    public string SelectedstatusValues{get;set;}
    public List<SelectOption> options{get;set;}
    public list<selectOption> productOptions{get;set;}
    public string selectedProductCode{get;set;}
    public string Quotepage{get;set;}
    public string Po{get;set;}
    public string Terms{get;set;}
    public string Shipvia{get;set;}
   
   
    public list<QuoteLineItemWrapper> lineItemswraplist{get;set;}  
    public String selectedProduct {get; set;}
    public product2 prod;
    public String ProductCode{get;set;}
    public String ProductName{get;set;}
    public String ProductDescription{get;set;}
    public list<QuoteLineItemWrapper> copyitem;
    // collection of wrapper class to show product with check box 
	public list<ProductlistWrapper> productlist{get;set;}
    // the soql without the order and limit
  private String soql {get;set;}
 

  // the current sort direction. defaults to asc
  public String sortDir {
    get  { if (sortDir == null) {  sortDir = 'asc'; } return sortDir;  }
    set;
  }
 
  // the current field to sort by. defaults to last name
  public String sortField {
    get  { if (sortField == null) {sortField = 'product2.Name'; } return sortField;  }
    set;
  }

  // format the soql for display on the visualforce page
  public String debugSoql {
    get { return soql + ' order by ' + sortField + ' ' + sortDir + ' limit 10'; }
    set;
  }
  
    
        public  QuotePageClass()
        {
        	
        	
        showTax=false;
            mailingaddress='';
            mailingaddress1='';
        	lineItemswraplist =new list<QuoteLineItemWrapper>();
           id quoteid=ApexPages.currentPage().getParameters().get('id');
           if(quoteid==null) {
              lineItemswraplist.add(new QuoteLineItemWrapper(new QuoteLineItem(quantity=1),null,null,null,false));
              lineItemswraplist.add(new QuoteLineItemWrapper(new QuoteLineItem(quantity=1),null,null,null,false));
           
           }else{
           	quote q = [select id,contactid, Subtotal,ShippingName,Tax__c,phone,email,name,contact.name,account.name,Shippingstreet,billingName,billingAddress,ShippingAddress,billingStreet,billingcountry,billingstate,billingcity, contact.MailingCity,contact.mailingstate,contact.mailingstreet,contact.mailingcountry from quote where id=:quoteid ];
           	searchTerm=q.ShippingName;
           	searchTerm1=q.billingName;
           	selectedContact=q.contactid;
           	subtotal=q.subtotal;
           	tax=q.Tax__c;
           	Quotepage=q.name;
           	mailingphone=q.phone;
           	mailingemail=q.email;
           	mailingaddress=q.billingStreet;
           	mailingaddress1=q.Shippingstreet;
           	System.debug('billing==> '+mailingaddress+' shipping==> '+mailingAddress1);
           	System.debug('billing address==>> '+q.billingAddress+'  ShipingAddress==> '+q.ShippingAddress);
           	mailingaaccount=q.account.name;
           list<QuoteLineItem>  LineItems=[select Adjustment__c,product2.family,PricebookEntryId,product2.productCode,description,Quantity,ListPrice,discount,UnitPrice,TotalPrice from QuoteLineItem where Quoteid=:quoteid];
           for(QuoteLineItem l:LineItems)
           lineItemswraplist.add(new QuoteLineItemWrapper(l,l.listprice,l.product2.family,l.product2.productCode,false));
           
           }
           
           string standard='standard';
             soql = 'select id,product2Id, product2.name,UnitPrice,product2.description, product2.family, product2.productcode from Pricebookentry where pricebook2.name=\''+standard+'\'';
    runQuery();
     
            cont=new contact();
            cont1=new contact();
            
            QuoteStatus=[Select id,status from quote];
            options = new List<SelectOption>();
            options.add(new selectoption ('--none--','--none--'));
            Schema.DescribeFieldResult fieldResult =Quote.status.getDescribe();
            List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
            for( Schema.PicklistEntry f : ple)
              {                       
                    options.add(new selectOption(f.getLabel(), f.getvalue())); //add the value and label to thge status picklist
              }
        }
        
        
        public void showContent(){
        
        showTax=showTax?false:true;
        }
        
        
        
    // JS Remoting action called when searching for a contact name
    @RemoteAction
    public static List<Contact> searchContact(String searchTerm) 
    {

        list<contact> Contacts = Database.query('Select Id, Name,account.name from contact where name like \'%' + String.escapeSingleQuotes(searchTerm) + '%\'');
        return Contacts;
    }
      
    // JS Remoting action called when searching for a account by name
      @RemoteAction
    public static List<account> searchAccount(String searchTerm) 
    {

        list<account> Accounts = Database.query('Select Id,billingStreet,billingCity,billingState,BillingCountry, Name from account where name like \'%' + String.escapeSingleQuotes(searchTerm) + '%\'');
        return Accounts;
    }  
    //This method is use for getting First contact's deatil
    public void contactdeatils()
    {
        mailingaaccount='';
        mailingemail='';
        mailingphone='';
        mailingaddress='';
        if(selectedContact!='' && selectedContact!=null )
        {
            cont=[select accountid,account.name,Email,Phone,MailingCity,MailingStreet,MailingState,MailingCountry,MailingPostalCode,MailingLatitude,MailingLongitude from contact where id=:selectedContact];
        }
  
        
        
        if(cont.account.Name!=null)
        {
            mailingaaccount=cont.account.name;
        }
        
        if(cont.email!=null)
        {
            mailingemail=cont.email;
        }
        
        if(cont.phone!=null)
        {
            mailingphone=cont.phone;
        }
        
        if(cont.MailingCity!=null)
        {
            mailingaddress=cont.MailingCity;
        }
        if(cont.MailingStreet!=null)
        {
            mailingaddress=mailingaddress+' '+cont.MailingStreet;
        }
        if(cont.MailingState!=null)
        {
            mailingaddress=mailingaddress+' '+cont.MailingState;
        }
        if(cont.MailingCountry!=null)
        {
            mailingaddress=mailingaddress+' '+cont.MailingCountry;
        }
        if(cont.MailingPostalCode!=null)
        {
            mailingaddress=mailingaddress+' '+cont.MailingPostalCode;
        }
        if(cont.MailingLatitude!=null)
        {
            mailingaddress=mailingaddress+' '+cont.MailingLatitude;
        }
        if(cont.MailingLongitude!=null)
        {
            mailingaddress=mailingaddress+' '+cont.MailingLongitude;
        }
    }
    
    //This method is use for getting Second contact's deatil
    public void contactdeatils1()
    {
        mailingaaccount1='';
        mailingemail1='';
        mailingphone1='';
        mailingaddress1='';
        if(selectedContact1!='' && selectedContact1!=null )
        {
            cont1=[select accountid,account.name,Email,Phone,MailingCity,MailingStreet,MailingState,MailingCountry,MailingPostalCode,MailingLatitude,MailingLongitude from contact where id=:selectedContact1];
        }
 
        
        
        if(cont1.account.Name!=null)
        {
            mailingaaccount1=cont1.account.name;
        }
        
        if(cont1.email!=null)
        {
            mailingemail1=cont1.email;
        }
        
        if(cont1.phone!=null)
        {
            mailingphone1=cont1.phone;
        }
        
        if(cont1.MailingCity!=null)
        {
            mailingaddress1=cont1.MailingCity;
        }
        if(cont1.MailingStreet!=null)
        {
            mailingaddress1=mailingaddress1+' '+cont1.MailingStreet;
        }
        if(cont1.MailingState!=null)
        {
            mailingaddress1=mailingaddress1+' '+cont1.MailingState;
        }
        if(cont1.MailingCountry!=null)
        {
            mailingaddress1=mailingaddress1+' '+cont1.MailingCountry;
        }
        if(cont1.MailingPostalCode!=null)
        {
            mailingaddress1=mailingaddress1+' '+cont1.MailingPostalCode;
        }
        if(cont1.MailingLatitude!=null)
        {
            mailingaddress1=mailingaddress1+' '+cont1.MailingLatitude;
        }
        if(cont1.MailingLongitude!=null)
        {
            mailingaddress1=mailingaddress1+' '+cont1.MailingLongitude;
        }
    }
    
    
    // save method the for saving the records
    public pageReference save()
    {
    	 Pricebook2 priceBook = [select id from Pricebook2 where name=:'Standard'];
     
      Quote q;
      id quoteid=ApexPages.currentPage().getParameters().get('id');
        //If first contact's account is not available then opportunity and contact will not be insert
        if(cont.accountid!=null)
        {
            if(quoteid==null){
            opportunity opp=new opportunity(Name='TestQuote',Accountid=cont.accountid,CloseDate=Date.Today(),StageName='Closed Won', pricebook2id=priceBook.id);
            insert opp;
          
            //IF contact two is not selected then Quote will not be insert
           
            if(selectedContact1!='' && selectedContact1!=null )
            {       
                 q=new quote(pricebook2id=priceBook.id,Name='Test1',Opportunityid=opp.id,BillingCity=cont.MailingCity,BillingCountry=cont.MailingCountry,
                BillingLatitude=cont.MailingLatitude,BillingLongitude=cont.MailingLongitude,BillingState=cont.MailingState,BillingStreet=cont.MailingStreet,
                BillingPostalCode=cont.MailingPostalCode,Contactid=selectedContact1,Phone=cont.phone,Email=cont.Email,Status=SelectedstatusValues,Quote__c=Quotepage,
                PO__c=Po,Terms__c=Terms,Ship_Via__c=Shipvia,ShippingCity=cont1.MailingCity,ShippingCountry=cont1.MailingCountry,ShippingStreet=cont1.MailingStreet,
                ShippingState=cont1.MailingState,BillingName=searchTerm1,ShippingName=searchTerm,ShippingPostalCode=Cont1.MailingPostalCode,ShippingLatitude=cont1.MailingLatitude,
                ShippingLongitude=cont1.MailingLongitude);
         
                insert q;
            }
            
              }
            
           
        
            
            
        }
        
        list<PriceBookEntry> entry = [select id,product2Id from PriceBookEntry where priceBook2.name=:'Standard'];
        for(integer i=lineItemswraplist.size();i>0;i--){
if((lineItemswraplist[i-1].family==''||lineItemswraplist[i-1].family==null)&&(lineItemswraplist[i-1].code==''||lineItemswraplist[i-1].code==null))
lineItemswraplist.remove(i-1);
}
        list<QuoteLineItem> tempQuoteList = new list<QuoteLineItem>();
        
        for( QuoteLineItemWrapper l:lineItemswraplist){
         System.debug('llllll===>>'+l);
          if(l.lineitem.quantity!=0)
          {
          	if(quoteid==null&&q==null)
          	{}
          	else if(quoteid==null)
            {l.lineItem.quoteid=q.id;
            tempQuoteList.add(l.lineItem);
            }
        }
          }
         
            
            
            if(tempQuoteList.size()>0) 
            upsert tempQuoteList;
            
          if(q!=null){  
        PageReference NewPage = new pagereference('/apex/QuotePage?id='+q.id);
        NewPage.setRedirect(true);
        return NewPage;
          }else return null;
          
    }
    
    
    // method for adding the new row
    public void add()
    {
       lineItemswraplist.add(new QuoteLineItemWrapper(new QuoteLineItem(quantity=1),null,null,null,false));
     
   
    }
    
    // button method for the removing the row
     public void remove()
    {   
       lineItemswraplist.remove(integer.valueOf(index)-1);
     
       
    }
    
    
    // method for deleting the selected records
    public void deleteSelected()
    {    
    	list<integer> count =new list<integer>();
    	integer im=0;
    	for(QuoteLineItemWrapper q:lineItemswraplist){
       im++;
       System.debug('index===>> '+im);
       if(q.b){
       	System.debug('index===>> '+(im-1));
      count.add(im-1);
       q.b=false;
       }
    
    	} 
    	if(count.size()>0){
    	for(integer i=count.size();i>0;i--){
    		 System.debug('index===>> '+count[i-1]);
    	lineItemswraplist.remove(count[i-1]);
    	}
    	}
       
    }
     
     // JS Remoting action called when searching for a Product name
    @RemoteAction
    public static List<string> searchProduct(String productsearchTerm) 
    {
        list<string> productFamily = new list<string>();
      
      //  list<product2> products = Database.query('Select Id, Name,family from product2 where name like \'%' + String.escapeSingleQuotes(productsearchTerm) + '%\'');
        
         Schema.DescribeFieldResult fieldResult =product2.family.getDescribe();
            List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for(Schema.PicklistEntry p:ple)
        {
        	if(p.getlabel().containsIgnoreCase(productsearchTerm))
        productfamily.add(p.getlabel());
        }
        return productFamily;
        
    }
     //This method is use for getting product's deatil
    @RemoteAction
    public static list<product2> productdeatils(string productsearchTerm,string productsearchfamilly)
    {
    	
    	
    	
        list<product2> prod;
        if(productsearchfamilly!=''||productsearchfamilly!=null)
        prod=Database.query('Select Id, Description,Name,family,ProductCode from product2 where ProductCode like \'%' + String.escapeSingleQuotes(productsearchTerm) + '%\' And family= \''+String.escapeSingleQuotes(productsearchfamilly)+'\'');
       
        
       if(productsearchfamilly==''||productsearchfamilly==null)
        prod=Database.query('Select Id, Description,Name,family,ProductCode from product2 where ProductCode like \'%' + String.escapeSingleQuotes(productsearchTerm) + '%\''); 
     
  
       
        return prod;       
        
}

// method for getting the list price from the price book entry for the product
@RemoteAction
public static pricebookentry pricebooklistprice(string code){ 

string standard='standard';
priceBookEntry entry= DataBase.query('select id,UnitPrice from priceBookEntry where pricebook2.name= \''+String.escapeSingleQuotes(standard)+'\' and product2.productcode=\''+String.escapeSingleQuotes(code)+'\'');

return entry;
}  


// method for adding the selected products
public void addProduct(){
list<pricebookentry> product2list = new list<pricebookentry>();

for(integer i=lineItemswraplist.size();i>0;i--){
if((lineItemswraplist[i-1].family==''||lineItemswraplist[i-1].family==null)&&(lineItemswraplist[i-1].code==''||lineItemswraplist[i-1].code==null))
lineItemswraplist.remove(i-1);
}
  for( ProductlistWrapper pr:productlist){
  if(pr.b)
  {
  	System.debug('in 1st loop');
 product2list.add(pr.product);
 lineItemswraplist.add(new QuoteLineItemWrapper(new QuoteLineItem(description=pr.product.product2.description,Product2=pr.product.product2,pricebookentryId=pr.product.id,unitprice=pr.product.UnitPrice,quantity=1),pr.product.UnitPrice,pr.product.product2.family,pr.product.product2.productCode,false));
  }
  }
  
  
  
/*
list<priceBookEntry> enrtylist = [select id , name, UnitPrice,product2id from pricebookentry where id IN: product2list and pricebook2.name=:'standard'];
map<id,priceBookEntry> proIdToEntryMap = new map<id,priceBookEntry>();

for(priceBookEntry e:enrtylist){
proIdToEntryMap.put(e.product2id,e);
}

System.debug('proIdToEntryMap===>> '+proIdToEntryMap.size());
for( ProductlistWrapper pr:productlist){
System.debug('boolean==> '+pr.b);
  if(pr.b){
  	System.debug('FFFFFFFFFF===>'+pr.product.product2.family);
  	System.debug('gggggggg====> '+pr.product.product2.productCode);
  

	}
  }*/

}

public void copySelected(){
  copyitem = new list<QuoteLineItemWrapper>();
  string value=''; 
  for(QuoteLineItemWrapper lw:lineItemswraplist){
  if(lw.b){	
  copyitem.add(lw);
  System.debug('entryId==>>'+lw.lineitem.PricebookEntryId);
  value+=lw.lineitem.PricebookEntryId+','+lw.lineitem.Unitprice+','+lw.lineitem.Quantity+','+lw.lineitem.Adjustment__c+'$';    
      }
    }
    System.debug('value==>> '+value);
    cookie counter = new cookie('counter',value,null,-1,false);
    ApexPages.currentPage().setCookies(new Cookie[]{counter});
  }
  
  
  public void pasteSelected(){
  Cookie counter = ApexPages.currentPage().getCookies().get('counter');
  list<id> pricebookId = new list<id>();
  map<id,list<string>> entryToDataMap = new map<id,list<string>>();
  id id;
  string unitprice;
  string Quantity; 
  string Adjustment;
  System.debug('cookie==>> '+counter);
  if(counter!=null){
  string value = counter.getValue();
  list<string> copiedValues = value.split('\\$');

  for(string st:copiedValues){
  	list<string> datalist = new list<string>();
  list<string> values = st.split(',',-1);
 if(values.size()>0){
pricebookId.add(values[0]);
id=values[0];
 unitprice=values[1];
 quantity=values[2];
 Adjustment=values[3];
 datalist.add(values[1]);
 datalist.add(values[2]);
 datalist.add(values[3]);
 entryToDataMap.put(id,datalist);
 }
 
 
 
  }
  list<PriceBookEntry> entrylsit = [select id,unitprice,product2.family,product2.Description,product2.ProductCode from priceBookEntry where ID IN:priceBookId order by product2.productcode];
  
 // System.debug('entrylsit==>> '+entrylsit.size());
 for(integer i=lineItemswraplist.size();i>0;i--){
if((lineItemswraplist[i-1].family==''||lineItemswraplist[i-1].family==null)&&(lineItemswraplist[i-1].code==''||lineItemswraplist[i-1].code==null))
lineItemswraplist.remove(i-1);
}
 
 for(PriceBookEntry pr:entrylsit){
lineItemswraplist.add(new QuoteLineItemWrapper(new QuoteLineItem(Description=pr.product2.Description,PricebookEntryId=pr.id, Quantity=decimal.valueOf(entryToDataMap.get(pr.id)[1]),unitprice=decimal.valueOf(entryToDataMap.get(pr.id)[0]),Adjustment__c=entryToDataMap.get(pr.id)[2]),pr.unitprice,pr.product2.family,pr.product2.productCode,false)); 
 }
      
    }
  }
    
/************************************************************************************************************/
  // toggles the sorting of query from asc<-->desc
  public void toggleSort() {
    // simply toggle the direction
    sortDir = sortDir.equals('asc') ? 'desc' : 'asc';
    // run the query again
    runQuery();
  }

  // runs the actual query
  public void runQuery() {
productlist = new list<ProductlistWrapper>();
    try {
   List<pricebookentry>    contacts = Database.query(soql + ' order by ' + sortField + ' ' + sortDir + ' limit 10');
    for(pricebookentry p: contacts){
    productlist.add(new ProductlistWrapper(p,false));
    }
    } catch (Exception e) {
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops!'));
    }

  }

  // runs the search with parameters passed via Javascript
  public PageReference runSearch() {

    String firstName = Apexpages.currentPage().getParameters().get('firstname');
    String lastName = Apexpages.currentPage().getParameters().get('lastname');
    String accountName = Apexpages.currentPage().getParameters().get('accountName');
   
string standard='standard';
    soql = 'select id,product2Id, product2.description,product2.name, product2.family, product2.productcode from pricebookEntry where priceBook2.name=\''+standard+'\'';
    if (!firstName.equals(''))
      soql += ' and product2.name LIKE \''+String.escapeSingleQuotes(firstName)+'%\'';
    if (!lastName.equals(''))
      soql += ' and product2.productcode LIKE \''+String.escapeSingleQuotes(lastName)+'%\'';
    if (!accountName.equals(''))
      soql += ' and product2.family LIKE \''+String.escapeSingleQuotes(accountName)+'%\'';
  

    // run the query again
    runQuery();

    return null;
  }
  
 
  // wrapper for showing the products with check box
  public class ProductlistWrapper{
  public pricebookentry product{get;set;}
  public boolean b{get;set;}
  public ProductlistWrapper(pricebookentry p,boolean b){
  
  this.product = new pricebookentry();
  this.product=p;
  this.b=b;
  }
  
  }
/************************************************************************************************************/

//  wrapper for showing line items with check box
public class QuoteLineItemWrapper{
	
public QuoteLineItem lineItem{get;set;}
public boolean b{get;set;}  
public string family{get;set;}
public string code{get;set;}
public decimal listprice{get;set;}
public QuoteLineItemWrapper(QuoteLineItem lineItem,decimal listprice,string family, string code,boolean b){
this.lineItem = new QuoteLineItem();
this.lineItem=lineItem;
 this.b=b;
 this.family=family;
 this.code=code;
this.listprice= listprice;

}

}

}