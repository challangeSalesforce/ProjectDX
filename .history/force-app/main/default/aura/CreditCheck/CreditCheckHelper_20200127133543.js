({
    doSave : function(component, event, helper) {
        var action = component.get('c.createCase');
        var accId = component.get('v.recordId');
        var caseRec = component.get('v.createNewCase');
        caseRec.AccountId = accId;
        action.setParams({
            cs : caseRec
        });
            action.setCallback(this,function(result){
            var getAllValue = component.get('v.createNewCase');
        });
            $A.enqueueAction(action);
    },
    closeModal : function() {
        var closeEventModal = $A.get("e.force:closeQuickAction");
        if(closeEventModal) {
            closeEventModal.fire();
        } else {
            alert('force:closeQuickAction event is not supported');
        }
    }
})