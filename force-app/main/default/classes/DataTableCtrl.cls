/* 
Author : Nitesh Kumawat
Used : tableComponent (LWC)
*/
public with sharing class DataTableCtrl {
    
    public DataTableCtrl(){

    }

    public static List<CaseWrapper> returnCaseObject(String recordLimit){
        List<CaseWrapper> CaseWrapperList = new List<CaseWrapper>();
        for (Case cas : [SELECT Id, 
                                CaseNumber,
                                Subject,
                                ContactEmail,
                                IsEscalated,
                                AccountId,
                                Account.Name,
                                ContactId,
                                Contact.Name,
                                Status,
                                ContactPhone,
                                ClosedDate
                                    FROM Case]){
            CaseWrapperList.add(new CaseWrapper(false, cas));
        }
        return CaseWrapperList;
    }

    public class CaseWrapper{
        public Boolean SelectFlag{get;set;}
        public Case acc{get;set;}

        public CaseWrapper(Boolean SelectFlag, Case acc){
            this.SelectFlag = SelectFlag;
            this.acc = acc;
        }
    }
}