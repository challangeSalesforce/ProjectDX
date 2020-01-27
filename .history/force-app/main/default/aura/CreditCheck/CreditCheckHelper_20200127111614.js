({
    doSave() {
        var action = component.get('c.createCase');
        action.setParams({
            cs : component.get('v.createNewCase')
        });
            action.setCallback(this,function(result){
            var getAllValue = component.get('v.createNewCase');
            alert(JSON.stringify(getAllValue));
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