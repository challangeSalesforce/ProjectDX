({
     
      createCase: function(component, event) {
        this.insertCase(component, event, function(a) {
            var cases = component.get("v.cases");
            cases.push(a.getReturnValue());
            component.set("v.cases", cases);
          });
    },
    insertCase : function(component, event, callback) {
        var action = component.get("c.saveCase");
        console.log('HERE1');
        action.setParams({ 
            "case": event
        });
        if (callback) {
          action.setCallback(this, callback);
        }
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