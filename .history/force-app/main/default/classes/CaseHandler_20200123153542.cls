public class CaseHandler {

    public static void caseCheckCredit(List<Case> caseList) {
        Id devRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Credit Check').getRecordTypeId();
        List<Id> accIds = new List<Id>();
        List<Id> caseIds = new List<Id>();
        System.debug('devRecordTypeId ' + devRecordTypeId);
        if(devRecordTypeId != null) {
            for(Case cs : caseList) {
                if(cs.AccountId != null) {
                    accIds.add(cs.AccountId);
                    caseIds.add(cs.Id);
                }
            }
        }
        List<Account> accRecords = new List<Account>();
        if(accIds.size() > 0 && accIds != null) {
        List<Account> acct = [Select Id, Name From Account Where Id In :accIds AND Credit_Check_Status__c = null];
        List<Case> caseList = [Select Id, Credit_Check_Status__c From Case Where Id In :caseIds AND Credit_Check_Status__c != null];
            for(Account ac :acct) {
                for(Case cs : caseList) {
                    ac.Credit_Check_Status__c = cs.Credit_Check_Status__c;
                }
                 
                accRecords.add(ac);       
            }
        }
        update accRecords;
        
    }
}
