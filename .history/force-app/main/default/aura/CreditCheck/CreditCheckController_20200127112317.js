({   
    doInit : function(component, event, helper) {
        var action = component.get('c.getPickListValues');
        action.setParams({
            objectName : component.get('v.objectName'),
            fieldName : component.get('v.fieldName')
        });
        action.setCallback(this,function(result){
            var resultValue = result.getReturnValue();
            component.set('v.creditCheckList',resultValue);
        });
        $A.enqueueAction(action);

        var recordId = component.get("v.recordId");
        var actionAcc = component.get("c.getAccount");
        actionAcc.setParams({
            accId : recordId
        });    
        actionAcc.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var result = response.getReturnValue();
                component.set("v.record", result);
            } else {
                alert(state);
            }
        });
        $A.enqueueAction(actionAcc);
    },

    doSave : function(component, event, helper){
        //helper.doSave(component, event);
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

    closeModal : function(component, event, helper) {
        helper.closeModal();
    }
})