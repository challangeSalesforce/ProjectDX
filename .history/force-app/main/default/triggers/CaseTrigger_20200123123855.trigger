trigger CaseTrigger on SOBJECT (after insert) {
     if(Trigger.isInsert) {
            System.debug('after insert');
            CaseHandler.caseUpdate(Trigger.new);
        } 
}