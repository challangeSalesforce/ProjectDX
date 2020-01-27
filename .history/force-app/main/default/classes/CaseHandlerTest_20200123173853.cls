@isTest
public class CaseHandlerTest {

    @TestSetup
    static void makeData(){
        Account accRecord = new Account();
        accRecord.Name = 'Check Credit Account';
        accRecord.NumberOfEmployees = 10;
        insert accRecord;

        Case caseRecord = new Case();
        caseRecord.Status = 'New';
        caseRecord.AccountId = accRecord.Id;
        caseRecord.Credit_Check_Status__c = 'Rejected';
        insert caseRecord;
    }

    @istest
    static void caseCheckCreditTest() {
        List<Case> caseSelection = [Select Id, Status,Credit_Check_Status__c From Case ];
        CaseHandler.caseCheckCredit(caseSelection);
    }
}
