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
    static void caseCheckCreditTest() {
        List<Case> caseSelection = [Select Id, Status,Credit_Check_Status__c, AccountId From Case];
        CaseHandler.caseCheckCredit(caseSelection);
        Account selectAccount = [Select Id, Name, Credit_Check_Status__c From Account Limit 1];
        System.assertEquals('Rejected', selectAccount.Credit_Check_Status__c);
    }
}
