public class setter
{
    String searchText;
    list<Lead> results;
    
    public string getSearchText()
    {
    return SearchText;
    }
    
    public void setSearchText(String s)
    {
    searchText=s;
    }
    
    public List<Lead> getResults()
    {
    return results;
    }
    
    public PageReference doSearch()
    {
    results=(List<Lead>)[FIND: searchText RETURNING Lead(Name,Email,Phone,MobilePhone,Website,LeadSource)][0];
    return null;
    }
}