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
        Id recordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Credit Check').getRecordTypeId();
        Account selectAccount = [Select Id, Name, Credit_Check_Status__c From Account Limit 1];
        Case newCase = new Case();
        newCase.Status = 'New';
        newCase.AccountId = selectAccount.Id;
        newCase.Credit_Check_Status__c = 'Rejected';
        newCase.RecordtypeId = recordTypeId;
        Case cs = CaseHandler.createCase(newCase);
        System.assert(String.isNotBlank(cs.Id));
    }

    @istest
    static void getAccountTest() {
        Account selectAccount = [Select Id, Name, Credit_Check_Status__c From Account Limit 1];
        Account acc = CaseHandler.getAccount(selectAccount.Id);
        System.assert(String.isNotBlank(acc.Id));
    }

    @isTest
    static void getPickListValuesTest() {
        //Case cs = [Select Id, Status,Credit_Check_Status__c, AccountId From Case Limit 1];
        Id recordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Credit Check').getRecordTypeId();
        Account selectAccount = [Select Id, Name, Credit_Check_Status__c From Account Limit 1];
        Case newCase = new Case();
        newCase.Status = 'New';
        newCase.AccountId = selectAccount.Id;
        newCase.Credit_Check_Status__c = 'Rejected';
        newCase.RecordtypeId = recordTypeId;
        insert newCase;
        CaseHandler.getPickListValues('Case', newCase.Status);
    }
}