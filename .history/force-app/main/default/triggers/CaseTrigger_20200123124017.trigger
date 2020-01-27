trigger CaseTrigger on Case (after insert) {
     if(Trigger.isInsert) {
            System.debug('after insert');
            CaseHandler.caseUpdate(Trigger.new);
        } 
}