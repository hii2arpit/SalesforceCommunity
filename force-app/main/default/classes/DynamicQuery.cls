public class DynamicQuery
{
  String s;
	public void Main(list<String> a, string b , string c)
 	{
        s = 'Select ';
       // system.debug('sss---->' +s);
        s = s + String.join(a, ',');
	//	System.debug('s--->> ' + s);  
        s=s+' from ';
      //  System.debug('s--->> ' + s); 
       // s += b;
       // s += ' ';
       // s += c;
        System.debug('s--->> ' + s+b+c);
        string t = 'abc';
        List<sObject> sobjList = Database.query(s+b+c+'t');
        system.debug('Result--->> ' + sobjList);
    }
}