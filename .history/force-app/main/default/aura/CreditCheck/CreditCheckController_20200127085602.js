({   
    doInit : function(component, event, helper) {
        var action = component.get('c.getPickListValues');
        action.setParams({
            objName : component.get('v.objName'),
            fldName : component.get('v.fldName')
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

    docancel : function(component, event, helper){
        component.set('v.createNewCase');
    }
    /*closeModal : function(component, event, helper) {
        helper.closeModal();
    }*/
})