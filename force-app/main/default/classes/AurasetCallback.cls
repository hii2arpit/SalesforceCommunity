public with sharing class AurasetCallback {
  @AuraEnabled
  public static String name() {
    return 'Arpit Jain';
  }

  @AuraEnabled
  public static list<Account> getAccount(string strIndustry) {
    return [
      SELECT ID, Name, Phone, Industry
      FROM ACCOUNT
      WHERE Industry = :strIndustry
    ]; // 3 records
  }

  @AuraEnabled
  public static string createAccount(Account acc) {
    try {
      insert acc;
      return acc.id;
    } catch (exception e) {
      return 'Exception:' + e.getMessage();
    }
  }

  @AuraEnabled
  public static customerinfo searchAccount(String strIndustry) {
    customerinfo obj1 = new customerinfo();
    try {
      Account acc1 = new Account();
      acc1 = [
        SELECT id, Name, Phone, Industry
        FROM account
        WHERE Industry = :strIndustry
        LIMIT 1
      ];
      System.debug(acc1);
      obj1.accName = acc1.Name;
      obj1.accPhone = acc1.Phone;
      obj1.accIndustry = acc1.Industry;
      obj1.status = 'SUCCESS';
    } catch (Exception e) {
      obj1.status = 'Error: ' + e.getMessage();
    }
    return obj1;
  }

  //This method is using in LWC dataTable component for inline edit, Lazy Loading, etc.
  @AuraEnabled(cacheable=true)
  public static List<Account> getAccounts() {
    return [
      SELECT id, Name, Phone, Industry, AnnualRevenue, Rating
      FROM ACCOUNT
      // LIMIT 20
    ];
  }

  @AuraEnabled(cacheable=true)
  public static List<Account> getAccountList(){
      return [SELECT Id,Name FROM Account LIMIT 10];
  }

  //This method is using in dataTable_RowActions LWC component.
  @AuraEnabled
  public static void deleteAccount(list<Id> deleteId){
    try{
      list<account> lstAcntToDelete = new list<account>();
      for(Id idAcnt : deleteId) {
        system.debug('Check the id os the record-->'+ idAcnt);
                lstAcntToDelete.add(new Account(Id = idAcnt));
            }
            if(!lstAcntToDelete.isEmpty()) {
              system.debug('Id is availabel in the lsit');
                delete lstAcntToDelete;
            }
        }catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
  }

  //This method is using in dataTable_RowActions LWC component for deleting selected records.
  @AuraEnabled
  public static void deleteSelectedAccount(list<Account> acntlist){
    delete acntlist;
  }

  

  @AuraEnabled(cacheable=true)
  public static List<Contact> getContacts(String name) {
    return [select id, name, phone, email, account.name from contact where name=: name];
  }

  @AuraEnabled
  public static List<Contact> getallContacts() {
    return [select id, name, phone, email, account.name from contact limit 100];
  }

  @AuraEnabled
  public static List<customerinfo> getAcc() {
    list<customerinfo> cust = new List<customerinfo>();
    for (Account acc : [
      SELECT id, Name, Phone, Industry
      FROM ACCOUNT
      LIMIT 10
    ]) {
      customerinfo cus = new customerinfo();
      cus.accName = acc.Name;
      cus.accPhone = acc.Phone;
      cus.accIndustry = acc.Industry;
      cust.add(cus);
    }
    return cust;
  }

  @AuraEnabled
  public static List<string> getPicklistValue() {
    List<String> options = new List<String>();
    Schema.DescribeFieldResult picklistVal = Account.Industry.getDescribe();
    List<Schema.pickListentry> plist = picklistVal.getPicklistValues();
    for (Schema.PicklistEntry pe : plist) {
      options.add(pe.getLabel());
    }
    return options;
  }

  //This method is use for get the rcordTypeid in CreateRecordAuraEvent Component.
  @AuraEnabled
  public static string getRecordTypeId() {
    String recordTyId = '';
    try {
      recordTyId = Schema.SObjectType.Contact.getRecordTypeInfosByName()
        .get('Test')
        .getRecordTypeId();
    } catch (Exception e) {
      System.debug('Exception--------------> ' + e);
    }
    return recordTyId;
  }

  //This method is usign in Map AUra Component.
  @AuraEnabled
  public static list<Location> getBillingLocation(id currentrecordid) {
    list<Account> acc = [
      SELECT
        Id,
        Name,
        Type,
        Industry,
        Description,
        BillingAddress,
        BillingStreet,
        BillingCity,
        BillingCountry,
        BillingPostalCode,
        BillingState,
        Phone
      FROM Account
      WHERE id = :currentrecordid
    ];

    //  list<Contact> cont = [Select id, Name,MailingStreet,MailingCity, MailingCountry,MailingPostalCode,
    //                        MailingState,Phone from contact  where Accountid =: currentrecordid];

    list<Contact> cont = [
      SELECT
        id,
        Name,
        MailingStreet,
        MailingCity,
        MailingCountry,
        MailingPostalCode,
        MailingState,
        Phone
      FROM contact
      WHERE
        MailingStreet != NULL
        AND MailingCity != NULL
        AND MailingCountry != NULL
        AND MailingPostalCode != NULL
        AND MailingState != NULL
    ];

    List<Location> loc = new List<Location>();

    for (Contact con : cont) {
      GeoLocation gl = new GeoLocation();
      gl.City = con.MailingCity;
      gl.Street = con.MailingStreet;
      gl.State = con.MailingState;
      gl.PostalCode = con.MailingPostalCode;
      gl.Country = con.MailingCountry;

      Location l = new Location();
      l.icon = 'action:map';
      l.title = con.Name;
      l.description = con.Name;
      l.location = gl;

      loc.add(l);
    }

    return loc;
  }

  //This method is using in createRecordAuraEvent component to navigting to list view
  @AuraEnabled
  public static List<ListView> getListViews() {
    List<ListView> listviews = [
      SELECT Id, Name
      FROM ListView
      WHERE SobjectType = 'Contact'
    ];

    // Perform isAccessible() check here
    return listviews;
  }

  //This method is created for lazyLoadingComonent
  @AuraEnabled
  public static AccountWrapper getAccountRecordsinLazyLoading(
    Integer initialRows
  ) {
    AccountWrapper accountwrapper = new AccountWrapper();
    try {
      accountwrapper.accountlist = [
        SELECT id, Name, rating, AccountSource
        FROM Account
        ORDER BY Name ASC
        LIMIT :initialRows
        OFFSET 0
      ];
      accountWrapper.totalRecords = [SELECT COUNT() FROM Account];
      accountWrapper.message = 'Account records are loaded';
      accountWrapper.success = true;
    } catch (Exception e) {
      accountWrapper.message = e.getMessage();
      accountWrapper.success = false;
    }
    return accountWrapper;
  }

  //To return additional records based on offset and I am using this in LazyLoading Component
  @AuraEnabled
  public static List<Account> loadAccountRecords(
    Integer rowLimit,
    Integer rowOffset
  ) {
    return [
      SELECT ID, Name, Rating, AccountSource
      FROM Account
      ORDER BY Name ASC
      LIMIT :rowLimit
      OFFSET :rowOffset
    ];
  }

  //This method I am using in Input_Toggle_DataTableController Component
  @AuraEnabled
  public static list<opportunity> getOppList() {
    return [
      SELECT id, Name, Amount, Probability, CloseDate, StageName
      FROM Opportunity
    ];
  }

  //This method I am using in Input_Toggle_DataTableController Component
  @AuraEnabled
  public static string saveOpp(opportunity opp) {
    String message;
    Database.SaveResult sr = Database.insert(opp, false);
    if (!sr.isSuccess()) {
      for (Database.Error er : sr.getErrors()) {
        message = er.getMessage();
      }
    }
    return message;
  }

  //This method I am using in Input_Toggle_DataTableController Component
  @AuraEnabled
  public static List<string> getStagePicklistValue() {
    List<String> options = new List<String>();
    Schema.DescribeFieldResult picklistVal = Opportunity.StageName.getDescribe();
    List<Schema.pickListentry> plist = picklistVal.getPicklistValues();
    for (Schema.PicklistEntry pe : plist) {
      options.add(pe.getLabel());
    }
    return options;
  }

  // //Testing LazyLoading Component
  // //To return initial account records
  // @AuraEnabled
  // public static AccountWrapper1 getAccountRecords(Integer initialRows){
  //     AccountWrapper1 accountWrapper= new AccountWrapper1();
  //     try{
  //         accountWrapper.accountsList = [SELECT ID,Name,Rating,AccountSource FROM Account ORDER BY Name ASC LIMIT :initialRows OFFSET 0];
  //         accountWrapper.totalRecords = [SELECT COUNT() FROM Account];
  //         accountWrapper.message = 'Account records are loaded';
  //         accountWrapper.success = true;
  //     }
  //     catch(Exception e){
  //         accountWrapper.message = e.getMessage();
  //         accountWrapper.success = false;
  //     }
  //     return accountWrapper;
  // }

  // //To return additional records based on offset
  // @AuraEnabled
  // public static List<Account> loadAccountRecords1(Integer rowLimit,Integer rowOffset){
  //     return [SELECT ID,Name,Rating,AccountSource FROM Account ORDER BY Name ASC LIMIT :rowLimit OFFSET :rowOffset];
  // }

  // // wrapper class
  // public class AccountWrapper1{
  //     @AuraEnabled
  //     public Integer totalRecords = 0;
  //     @AuraEnabled
  //     public List<Account> accountsList = new List<Account>();
  //     @AuraEnabled
  //     public String message;
  //     @AuraEnabled
  //     public Boolean success;
  // }

  //This method is using in component name: childComponentSaveAccountWithEvent
  @AuraEnabled
  public static string saveAccountUsingEvent(Account acnt) {
    try {
      insert acnt;
      return acnt.id;
    } catch (Exception e) {
      return 'Error';
    }
  }

  //This method is using in wire_SearchRecord LWC component
  @AuraEnabled(cacheable=true)
  public static list<Account> getSearchedAccounts(string name) {
    string key = '%' + name + '%';
    return [
      SELECT id, name, Website, industry, Rating, AccountSource
      FROM account
      WHERE name LIKE :key
      LIMIT 15
    ];
  }

  //Wrapper Class
  public class customerinfo {
    @AuraEnabled
    public String accName;
    @AuraEnabled
    public String accPhone;
    @AuraEnabled
    public String accIndustry;
    @AuraEnabled
    public String status;
  }

  public class Location {
    @AuraEnabled
    public String icon { get; set; }
    @AuraEnabled
    public String title { get; set; }
    @AuraEnabled
    public String description { get; set; }
    @AuraEnabled
    public GeoLocation location { get; set; }
  }

  public class GeoLocation {
    @AuraEnabled
    public String Street { get; set; }
    @AuraEnabled
    public String State { get; set; }
    @AuraEnabled
    public String PostalCode { get; set; }
    @AuraEnabled
    public String City { get; set; }
    @AuraEnabled
    public String Country { get; set; }
  }

  public class AccountWrapper {
    @AuraEnabled
    public Integer totalRecords = 0;
    @AuraEnabled
    public String message;
    @AuraEnabled
    public Boolean success;
    @AuraEnabled
    public List<Account> accountlist = new List<account>();
  }


    @AuraEnabled
       public static List<Account> getAllAccount(){
           return [SELECT Id,Name,Phone FROM Account limit 5];
       }
       
       @AuraEnabled
       public static String delAccount(String[] lstAccountId){
           string msg='';
           List<Account> lstAcc=[SELECT Id FROM Account WHERE Id IN: lstAccountId];
           try{
               if(lstAcc.size()>0)
                   delete lstAcc;
           }
           catch(Exception ex){
               msg=ex.getMessage()+'\n'+ex.getLineNumber()+'\n'+ex.getCause();
           }
           return msg;
       }
}