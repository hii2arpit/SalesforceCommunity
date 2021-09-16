public class Opportuni
{
  public static void checkopp(List<Opportunity> opps)
    {
        Decimal Total_Amount=0;
        for(opportunity ol:[select id,Amount from opportunity where createdDate=Today And CreatedbyID= :UserINfo.getUserID()])
        {
           Total_Amount += ol.Amount; 
        }
        
        for(opportunity o2: opps)
        {
            Total_Amount +=o2.Amount;
                if(Total_Amount>500)
            {
                o2.addError('You have excedde daily limit');
            }
        }

    }}