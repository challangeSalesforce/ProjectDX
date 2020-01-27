@isTest
public class CaseHandlerTest {

    @TestSetup
    static void makeData(){
        Account accRecord = new Account();
        accRecord.Name = 'Check Credit Account';
        accRecord.NumberOfEmployees = 10;
        insert accRecord;

        Case caseRecord = new Case();
        Id recordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Credit Check').getRecordTypeId();
        caseRecord.Status = 'New';
        caseRecord.AccountId = accRecord.Id;
        caseRecord.Credit_Check_Status__c = 'Rejected';
        caseRecord.RecordtypeId = recordTypeId;
        insert caseRecord;
    }

    @istest
    static void caseCheckCreditTest() {
        List<Case> caseSelection = [Select Id, Status,Credit_Check_Status__c, AccountId From Case];
        CaseHandler.caseCheckCredit(caseSelection);
        Account selectAccount = [Select Id, Name, Credit_Check_Status__c From Account Limit 1];
        System.assertEquals('Rejected', selectAccount.Credit_Check_Status__c);
    }

    @isTest
    static void createCaseTest() {
        Case caseSelection = [Select Id, Status,Credit_Check_Status__c, AccountId From Case];
        Case cs = CaseHandler.createCase(caseSelection);
        System.assertEquals(String.isNotBlank(cs.id), cs.Id);
    }
    /*@istest
    static void caseCheckCreditTestApproved() {
        List<Case> caseSelection = [Select Id, Status,Credit_Check_Status__c, AccountId From Case];
        caseSelection[0].Credit_Check_Status__c = 'Approved';
        update caseSelection;
        CaseHandler.caseCheckCredit(caseSelection);
        Account selectAccount = [Select Id, Name, Credit_Check_Status__c From Account Limit 1];
        System.assertEquals('Rejected', selectAccount.Credit_Check_Status__c);
    }*/
}
