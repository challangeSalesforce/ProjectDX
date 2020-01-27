({   
    /*createCase : function(component, event, helper) {
    
        var subjectField = component.find("subject");
        var subject =  subjectField.get("v.value");
    
        var originField = component.find("origin");
        var origin =  originField.get("v.value");
    
        var statusField = component.find("status");
        var status =  statusField.get("v.value");
    
        var contactField = component.find("contact");
        var contact =  contactField.get("v.value");
    
        var newCase = component.get('v.newCase');
        newCase.subject = subject;
        newCase.origin = origin;
        newCase.status = status;
        newCase.contact = contact;
    
        console.log('newCase ' + newCase);
        helper.createCase(component, JSON.stringify(newCase));
    
    
        console.log('End of createCase');
    },   */
    doInit : function(component, event, helper) {
        var action = component.get('c.getPickList');
        action.setParams({
            objName : component.get('v.objName'),
            fldName : component.get('v.fldName')
        });
        action.setCallback(this,function(result){
            var resultValue = result.getReturnValue();
            component.set('v.ratingList',resultValue);
        });
        $A.enqueueAction(action);
        },

    doSave : function(component, event, helper){
        var action = component.get('c.createAccount');
        action.setParams({
            ac : component.get('v.createAcc')
        });
        action.setCallback(this,function(result){
        var getAllValue = component.get('v.createAcc');
        alert(JSON.stringify(getAllValue));
        });
        $A.enqueueAction(action);
        },

    docancel : function(component, event, helper){
        component.set('v.createAcc');
    }
    /*closeModal : function(component, event, helper) {
        helper.closeModal();
    }*/
})