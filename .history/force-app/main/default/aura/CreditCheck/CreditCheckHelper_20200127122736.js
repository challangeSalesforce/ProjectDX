({
    doSave : function(component, event, helper) {
        var action = component.get('c.createCase');
        var accId = component.get('v.recordId');
        var casee = component.get('v.createNewCase');
        casee.AccountId = accId;
        action.setParams({
            cs : casee
        });
            action.setCallback(this,function(result){
            var getAllValue = component.get('v.createNewCase');
            
            //alert(JSON.stringify(getAllValue));
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