global class customiterable implements Iterator<Account>
{
	List <Account> accs	{get;set;}
    Integer i{get;set;}
    
    public customiterable()
    {
        accs=[SELECT Id,Name,NumberofEmployees FROM Account WHERE Name='Arpit Jain'];
        i=0;
    }
    global boolean hasNext()
    {
       system.debug(accs.size());
        if(i>=accs.size())
        {
            return false;
        }
        else
        {
            return true;
        }
    }    
    global Account next()
    {
        if(i==8)
        {
            return null;
        }
        i++;
        return accs[i-1];
    }
}