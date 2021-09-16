public class TVRemoteControl 
{
    Integer Volume;
    static final Integer MAX_VOLUME=50;
    
    public TVRemoteControl(Integer v)
    {
        Volume=v;
    }
    
    public Integer increaseVolume(Integer amount)
    {
        volume +=amount;
        IF(volume>MAX_VOLUME)
        {
            volume=MAX_VOLUME;
        }
        return volume;
    }
    
    public Integer decreaseVolume(Integer amount)
    {
        volume -=amount;
        if(volume<0)
        {
            volume=0;
        }
        return volume;
    }
    public static string getMenuOptions()
    {
        return 'AUDIO SETTINGS - VIDEO SETTINGS';
    }

}