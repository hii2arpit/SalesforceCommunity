@isTest
public class TVRemoteControlTest 
{
    @isTest static void testVolumeIncrease()
    {
        TVRemoteControl rc=new TVRemoteControl(10);
        Integer newVolume= rc.IncreaseVolume(15);
        system.assertEquals(25, newVolume);
    }
    @isTest static void testVolumeDecrease()
    {
        TVRemoteControl rc=new TVRemoteControl(20);
        Integer newVolume=rc.decreaseVolume(15);
        system.assertEquals(5, newVolume);
    }
    @isTest static void testVolumeIncreaseOverMax()
    {
        TVRemoteControl rc=new TVRemoteControl(10);
        Integer newVolume= rc.increaseVolume(60);
        system.assertEquals(50, newVolume);
    }
    @isTest static void testVloumeDecreaseMini()
    {
        TVRemoteControl rc=new TVRemoteControl(10);
        Integer newVolume=rc.decreaseVolume(100);
        system.assertEquals(0,newVolume);
    }
    @isTest static void testgetmenuOptions()
    {
        String menu=TVRemoteControl.getMenuOptions();
        system.assertNotEquals(null, menu);
        system.assertNotEquals('', menu);
    }

}