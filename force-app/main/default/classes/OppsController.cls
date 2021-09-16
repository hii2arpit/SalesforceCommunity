public class OppsController 
{
        public ApexPages.StandardSetController setCon 
        {
                get
                {
                        if(setCon == null)
                                {
                                        setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT name, type, amount, closedate FROM Opportunity]));
                                        //setCon.setPageSize(5);
                                }
                                        return setCon;
                }
                        set;
        }


                public List<Opportunity> getOpportunities() 
                {
                        return (List<Opportunity>) setCon.getRecords();
                }

                public List<OppWrapper> getOpportunitiesWithIndex() 
                {
                        List<Opportunity> opps = this.getOpportunities();
                        List<OppWrapper> oppsWrapped = new List<OppWrapper>();
                        Integer idex = 1;
                        for (Opportunity opp : opps) 
                        {
                                oppsWrapped.add(new OppWrapper(opp, idex));
                                idex++;
                        }
                                return oppsWrapped;
                }

                public class OppWrapper 
                {
                        public Opportunity opp { get; set; }
                        public Integer taborderhint { get; set; }
                        public OppWrapper(Opportunity opp, Integer taborderhint) 
                        {
                        this.opp = opp;
                        this.taborderhint = taborderhint;
                        }
                }
}