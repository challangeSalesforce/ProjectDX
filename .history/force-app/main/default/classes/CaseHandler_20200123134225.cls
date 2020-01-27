public class CaseHandler {

    public static List<Case> caseCheckCredit(List<Case> cases) {
        Id devRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Credit Check').getRecordTypeId();
        List<Id> caseId;
        if(devRecordTypeId != null) {
            for(Case cs : cases) {
                caseId.add(cs.Id);
            }
        } else {
            return null;
        }
        List<Case> queryCaseWithAcc = [Select Id, Status, AccountId, Credit_Check_Status__c From Case Where Id In :caseId AND AccountId != null];
        if(queryCaseWithAcc.size() >0) {
            for(Case cs : queryCaseWithAcc) {
                if(String.isNotBlank(cs.Credit_Check_Status__c)) {
                    cs.AccountId.Credit_Check_Status__c = cs.Credit_Check_Status__c;
                    
                }
            }
        }
        return queryCaseWithAcc;
    }
}
