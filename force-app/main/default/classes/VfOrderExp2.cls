public with sharing class VfOrderExp2 {
    
    private final Account account;
    
    public VforderExp2()
    {
        account=[Select id,Name,Site,NumberofEmployees, Industry from Account Where id= :Apexpages.currentpage().getParameters().get('id')];
    }
    
    public Account getaccount()
    {
        return Account;
    }
    
    public pageReference save()
    {
        update Account;
        return null;
    }
    
    public pageReference cancel()
    {
        return null;
    }
}