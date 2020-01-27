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
        },

    doSave : function(component, event, helper){
        var action = component.get('c.createCase');
        action.setParams({
            ac : component.get('v.createNewCase')
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