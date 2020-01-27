trigger CaseTrigger on Case (after insert, after update) {
    if(Trigger.isAfter) {
        if(Trigger.isInsert || || Trigger.isUpdate) {
            System.debug('after insert');
            CaseHandler.caseCheckCredit(Trigger.new);
        } 
    }    
}