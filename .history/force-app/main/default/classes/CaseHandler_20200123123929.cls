public class CaseHandler {
    public static List<Case> caseCheckCredit(List<Case> cases) {
        Id devRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Credit Check').getRecordTypeId();
        List<Case> listCases = new List<Case>();
        if(devRecordTypeId != null) {
            //Account relatedAcc = [Select Id, Name From Account Where Id =:accId Limit 1];
            for(Case cs : cases) {
                listCases.add(cs);
            }
        } else {
            return null;
        }
        return null;
    }
}
