({
    doInit : function(component, event, helper) {
        var action = component.get('c.getPickListValues');
        action.setParams({
            objectName : component.get('v.objectName'),
            fieldName : component.get('v.fieldNameStatus')
        });
        action.setCallback(this,function(result){
            var resultValue = result.getReturnValue();
            component.set('v.statusList',resultValue);
        });
        $A.enqueueAction(action);

        var action = component.get('c.getPickListValues');
        action.setParams({
            objectName : component.get('v.objectName'),
            fieldName : component.get('v.fieldNameCreditCheck')
        });
        action.setCallback(this,function(result){
            var resultValue = result.getReturnValue();
            component.set('v.creditCheckList',resultValue);
        });
        $A.enqueueAction(action);

        var action = component.get('c.getPickListValues');
        action.setParams({
            objectName : component.get('v.objectName'),
            fieldName : component.get('v.fieldNameOrigin')
        });
        action.setCallback(this,function(result){
            var resultValue = result.getReturnValue();
            component.set('v.originList',resultValue);
        });
        $A.enqueueAction(action);

        var action = component.get('c.getPickListValues');
        action.setParams({
            objectName : component.get('v.objectName'),
            fieldName : component.get('v.fieldNamePriority')
        });
        action.setCallback(this,function(result){
            var resultValue = result.getReturnValue();
            component.set('v.priorityList',resultValue);
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
    doSave : function(component, event, helper) {
        var action = component.get('c.createCase');
        var accId = component.get('v.recordId');
        var caseRec = component.get('v.createNewCase');
        caseRec.AccountId = accId;
        action.setParams({
            cs : caseRec
        });
            action.setCallback(this,function(result){
            var result = response.getReturnValue(); 
            component.set("v.createNewCase", result);    
            //var getAllValue = component.get('v.createNewCase');
        });
        if(caseRec.Status && caseRec.Credit_Check_Status__c){
            $A.get("e.force:closeQuickAction").fire();
            $A.enqueueAction(action);
        }else if (caseRec.Status == null){
            alert('Please select a Status from picklist!');
        } else {
            alert('Please select a Credit Check Status from picklist!');
        }
        
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