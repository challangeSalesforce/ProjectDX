trigger CaseTrigger on Case (after insert) {
    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            System.debug('after insert');
            CaseHandler.caseCheckCredit(Trigger.new);
        } 
    }    
}