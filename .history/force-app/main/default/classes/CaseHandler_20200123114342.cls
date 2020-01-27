public class CaseHandler {
    public static List<Case> caseCheckCredit(Id accId) {
        Id devRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Credit Check').getRecordTypeId();
        if(devRecordTypeId != null) {
            Account relatedAcc = [Select Id, Name From Account Where Id =:accId Limit 1];
            
        }
    }
}
