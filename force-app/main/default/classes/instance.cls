public class instance {

    public class inside
    {
        Integer x;
        Integer y;
      inside()
      {
          system.debug('test');
      } 
        inside(Integer x, Integer y)
        {
            this.x=x;
            this.y=y;
        }
        
		              
        Integer getXcordinate()
        	{
            return x;
        	}
        Integer getYcordinate()
            {
                return y;
            }
    }
    
    List<inside> points= new List<inside>();
   
    public void instance(Integer x, Integer y)
    {
        points.add(new inside(x,y));
    }
}