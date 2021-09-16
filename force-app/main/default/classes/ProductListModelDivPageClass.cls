public class ProductListModelDivPageClass {
	
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
    get  { if (sortField == null) {sortField = 'Name'; } return sortField;  }
    set;
  }

  // format the soql for display on the visualforce page
  public String debugSoql {
    get { return soql + ' order by ' + sortField + ' ' + sortDir + ' limit 10'; }
    set;
  }

  // init the controller and display some sample data when the page loads
  public ProductListModelDivPageClass() {
  	
    soql = 'select id, name, family, productcode from Product2';
    runQuery();
  }

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
   List<product2>    contacts = Database.query(soql + ' order by ' + sortField + ' ' + sortDir + ' limit 10');
    for(product2 p: contacts){
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
   

    soql = 'select id, name, family, productcode from Product2 where isactive=true ';
    if (!firstName.equals(''))
      soql += ' and name LIKE \''+String.escapeSingleQuotes(firstName)+'%\'';
    if (!lastName.equals(''))
      soql += ' and productcode LIKE \''+String.escapeSingleQuotes(lastName)+'%\'';
    if (!accountName.equals(''))
      soql += ' and family LIKE \''+String.escapeSingleQuotes(accountName)+'%\'';
  

    // run the query again
    runQuery();

    return null;
  }
  
 
  
  public class ProductlistWrapper{
  public product2 product{get;set;}
  public boolean b{get;set;}
  public ProductlistWrapper(product2 p,boolean b){
  
  this.product = new product2();
  this.product=p;
  this.b=b;
  }
  
  }
}