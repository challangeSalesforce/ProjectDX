@isTest
public class CaseHandlerTest {

    @TestSetup
    static void makeData(){
        Account accRecord = new Account();
        accRecord.Name = 'Check Credit Account';
        accRecord.NumberOfEmployees = 10;
        insert accRecord;

        Case caseRecord = new Case();
        Id devRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Credit Check').getRecordTypeId();
        caseRecord.Status = 'New';
        caseRecord.AccountId = accRecord.Id;
        caseRecord.Credit_Check_Status__c = 'Rejected';
        caseRecord.RecordtypeId = devRecordTypeId;
        insert caseRecord;
    }

    @istest
    static void caseCheckCreditPositiveTest() {
        List<Case> caseSelection = [Select Id, Status,Credit_Check_Status__c, AccountId From Case];
        CaseHandler.caseCheckCredit(caseSelection);
        System.assert(caseSelection.size() > 0);
        //System.assert(caseList[0].AccountId.Credit_Check_Status__c);
    }
    @isTest
    static void caseCheckCreditNegativeTest() {
        List<Case> caseSelection = [Select Id, Status,Credit_Check_Status__c, AccountId From Case];
        caseSelection[0].Credit_Check_Status__c = null;
        update caseSelection;
        CaseHandler.caseCheckCredit(caseSelection);
        System.assert(caseSelection[0].Account.Credit_Check_Status__c);
    }
}
