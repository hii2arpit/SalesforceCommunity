public class pairNumbers
{
Integer x,y;
    public pairNumbers(Integer a, Integer b)
    {
        x=a;
    	y=b;
    }
public Boolean equals(Object obj)
    {
      
        if(obj instanceof pairNumbers)
        {
            pairNumbers p=(pairNumbers)obj;
              system.debug('test');
            return((x==p.x) && (y==p.y));
            
         }
        return false; 
    }
   
    public void a()
    {
       Map<pairNumbers,String> m= new Map<pairNumbers,String>();
        pairNumbers p1=new pairNumbers(1,2);
        pairNumbers p2=new pairNumbers(2,3);
        pairNumbers p3=new pairNumbers(1,2);
    		m.put(p1, 'first');
    	 	m.put(p2, 'second');
        	m.put(p3, 'third');
    system.assertEquals(2, m.size());
    
    if(p1==p3)
    {
        system.debug('p1 and p3 are equal');
    }
    
    system.assertEquals(true, m.containsKey(p1));
    system.assertEquals(true, m.containsKey(p2));
    system.assertEquals(false, m.containsKey(new pairNumbers(5,6)));
    
    for(pairNumbers pn: m.keySet())
    {
        system.debug('Key:' +pn);
    }
    
    List<String> mvalues= m.values();
    system.debug('m.values:'+ mvalues);
    
    Set<pairNumbers> s1= new Set<pairNumbers>();
    s1.add(p1);
    s1.add(p2);
    s1.add(p3);
    
    system.assertequals(2, s1.size()); 
    }
}