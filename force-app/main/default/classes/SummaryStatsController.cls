public class SummaryStatsController
{
    public Integer getVeryLargeSummry()
    {
        Integer ClosedOpportunity=[SELECT COUNT() FROM Opportunity Where Opportunity.IsClosed=true];
        return ClosedOpportunity;
    }
}