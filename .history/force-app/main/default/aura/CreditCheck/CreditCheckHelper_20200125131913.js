({
     
      createCase: function(component, event) {
        this.upsertCase(component, event, function(a) {
            var cases = component.get("v.cases");
            cases.push(a.getReturnValue());
            component.set("v.cases", cases);
          });
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