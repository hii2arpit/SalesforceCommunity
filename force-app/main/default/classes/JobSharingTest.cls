@isTest
public class JobSharingTest 
{
    static testmethod void testMnaualShareRead()
    {
        List<User> users= [SELECT Id FROM User WHERE IsActive=true LIMIT 2];
        Id User1Id=users[0].Id;
        Id User2Id=users[1].Id;
        
        Job__c j= new Job__C();
        j.Name='Test Job';
        j.OwnerId= user1Id;
        insert j;
        
        system.assertEquals(JobSharing.manualShareRead(j.Id, user2Id), true);
        
        List<Job__Share> jShrs=[SELECT Id, UserorGroupId, AccessLevel, RowCause FROM Job__Share WHERE ParentId= :j.Id AND UserorGroupId= :user2Id];
        
        system.assertEquals(jShrs.size(), 1,'Set the object\'s sharing model to Private.');
        
        system.assertEquals(jShrs[0].AccessLevel,'Read');
        system.assertEquals(jShrs[0].RowCause,'Manual');
        system.assertEquals(jShrs[0].userOrGroupId,user2Id);
        
        delete j;
        system.assertEquals(JobSharing.manualShareRead(j.Id, user2Id), false);
    }

}