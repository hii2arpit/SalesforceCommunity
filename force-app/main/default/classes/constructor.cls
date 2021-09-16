public class constructor 
{
	private Integer Default_size=10;
    Integer size;
    
    public constructor()//explicit default
    {
        this.Default_size=20;
        system.debug('I am explicit constructor');
    }
    public constructor(Integer objsize)
    {
        size=objsize;
        system.debug(size);
    }
}