trigger CaseTrigger on Case (after insert, after update) {
    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            CaseHandler.caseCheckCredit(Trigger.new);
        } 
    }    
}