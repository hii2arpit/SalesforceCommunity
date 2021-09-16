@isTest
public class TestUtility
{
    public static void createTestRecords(String numAccts,String numOpportunity) 
    {
         list<Account> acc=new list<Account>();
         acc.add(new Account(Name=numAccts));
         insert acc;
         system.debug('@@-->'+acc);
         
        list<Location__c> locationList=new list<Location__c>();
        locationList.add(new Location__c(Building_Name__c='Test',Location_Address_1__c='A4,Street Tx',Location_City__c='Dallas',Location_State__c='Tx',Zip_4__c='125412'));
        locationList.add(new Location__c(Building_Name__c='Testing',Location_Address_1__c='A4,Street VV',Location_City__c='NW',Location_State__c='FL',Zip_4__c='21254'));
        insert locationList;
        system.debug('@@locationlist'+locationlist);
        
        list<opportunity> opp=new list<opportunity>();
        opp.add(new opportunity(Name=numOpportunity,AccountId=acc[0].Id,StageName='Currentortunity Identified',CloseDate=Date.today(),
        LeadSource='Other',Loc_Z_Location__c=locationList[0].Id));
        opp.add(new opportunity(Name=numOpportunity,AccountId=acc[0].Id,StageName='Dead',CloseDate=Date.today(),LeadSource='Other',
        Loc_Z_Location__c=locationList[1].Id));
        insert opp;
        system.debug('--->>opportunity'+Opp);
    }
}