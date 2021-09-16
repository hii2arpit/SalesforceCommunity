public class VfPageOrderExample 
{
    	public string selectedValue
        {
            get;
            set{
                editmode=(value!=null);
                selectedValue= value;
            }
        }
    public Boolean editMode{get; private set;}

}