trigger updateaccoutnteammember on Top_X_Designation__c (after insert)
{
    set<id> accid = new set<id>();
    map<id,id> accuserid = new map<id,id>();
   	list<AccountTeamMember> atmlist = new list<AccountTeamMember>();
    for(Top_X_Designation__c td:Trigger.new)
    {
        if(td.Account_Manager__c!=null)
        {
          AccountTeamMember atm = new AccountTeamMember();
          atm.accountid = td.Account_Mater__c;
          atm.TeamMemberRole = 'Account Manager';
          atm.userid = td.Account_Manager__c;
          atmlist.add(atm);
        }
    }
    
  insert atmlist;
}