public class NewCaseListController
{
    public list<case> getNewCases()
    {
        list<case> c=[Select CaseNumber from case where status='new'];
  
    return c;
    }
}