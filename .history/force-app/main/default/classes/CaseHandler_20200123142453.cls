public class CaseHandler {

    public static void caseCheckCredit(List<Case> caseList) {
        Id devRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Credit Check').getRecordTypeId();
        List<Id> accIds = new List<Id>();
        System.debug('devRecordTypeId ' + devRecordTypeId);
        if(devRecordTypeId != null) {
            for(Case cs : caseList) {
                if(cs.AccountId != null) {
                    caseId.add(cs.AccountId);
                }
            }
        }
        List<Case> recordCase = new List<Case>();
        if(accIds.size() > 0 && accIds != null) {

        }
        
    }
}
