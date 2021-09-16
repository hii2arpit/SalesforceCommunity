public class SOQLExample3 {
    public list<Account> accs{get;set;}
    public string accName{get;set;}
    public string accIndustry {get;set;}
    
    public void Search()
    {
        accs=[Select Name, Industry from ACCOUNT Where Name=:accName and Industry =:accIndustry ];
    }
    public void dyanamicSOQL()
    {
        String query='Select id, Name, Industry from Account';
        if((accName!=null && accName!='') && (accIndustry!=null && accIndustry!=''))
        {
            query=query+' where Name=\''+accName+'\'+ and accIndustry=\''+accIndustry+'\'';
        }
        else
        {
            if(accName!=null && accName!='')
            {
                query=query+' where Name=\''+accName+'\'';
            }
            else
            {
                if(accIndustry!=null && accIndustry!='')
                {
                    query=query+' where Industry=\''+accIndustry+'\'';
                }
            }
        }
        accs=DataBase.query(query);
        
    }    
    public SOQLExample3()
    {
    
    }
}