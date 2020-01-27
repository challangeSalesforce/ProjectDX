public class CaseHandler {

    public static void caseCheckCredit(List<Case> caseList) {
        Id devRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Credit Check').getRecordTypeId();
        List<Id> accIds = new List<Id>();
        List<Id> caseIds = new List<Id>();
        List<Account> accRecords = new List<Account>();
        System.debug('devRecordTypeId ' + devRecordTypeId);
        for(Case cs : caseList) {
            if(cs.AccountId != null) {
                accIds.add(cs.AccountId);
                caseIds.add(cs.Id);
            }
        }    
        if(accIds.size() > 0 && caseIds.size() > 0) { 
        List<Account> acct = [Select Id, Name From Account Where Id In :accIds ];
        List<Case> queryCase = [Select Id, Credit_Check_Status__c From Case Where Id In :caseIds AND Credit_Check_Status__c != null AND RecordTypeId =:devRecordTypeId];
            if(queryCase.size() > 0){
                for(Account ac :acct) {
                    for(Case cs : queryCase) {
                        ac.Credit_Check_Status__c = cs.Credit_Check_Status__c;
                    }
                    accRecords.add(ac);       
                }
            }
        }
        try{
            update accRecords;
        }
        catch(DmlException e){
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
    }
}
