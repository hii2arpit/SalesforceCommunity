public class CustomIterator implements Iterator<List<Integer>>
{
    Integer c;
    List<Integer> Intlist;
    Integer Size;
    
   //Constructor
    public CustomIterator()
    {
      Intlist=new List<Integer>{1,2,14,5,6,8,10};
      c=0;
      Size=2;
    }
    
   //Method for check the next value in a list 
    public boolean hasNext()
    {

     if(c<=Intlist.size())
      {
        return true;
      }
     
        return false;
    }
    
    //Method for check the 
    public List<Integer> next()
    {
      list<integer> temp=new list<Integer>();
      if(hasNext())
      {     
        for(Integer i=c; i<size+c && i<Intlist.size(); i++)
        {        
            system.debug('Value'+i);
          temp.add(Intlist[i]);
        }
        c=c+size; 
        system.debug(temp);
        return temp;
      }
      else
      {
      return null;
      }
    }
}