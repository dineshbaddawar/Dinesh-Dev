({
	showInformation : function(component, event, helper) {
        var toastMessage = $A.get("e.force:showToast");
        toastMessage.setParams({
            title: 'Information',
            message: 'This is Information Message',
            duration: '3000',
            key: 'info_alt',
            type:'info',
            mode: 'dismissiable'
            
        });
        toastMessage.fire();
	},
    
    showError : function(component, event, helper){
        var MessageToast = $A.get("e.force:showToast");
        MessageToast.setParams({
            title: 'Error',
            message: 'This is an Error Message',
            duration: '2000',
            key: 'info_alt',
            type:'error',
            mode:'pester'
        });
        MessageToast.fire();
    },
    
    showWarning : function(component, event, helper){
        var Toast = $A.get("e.force:showToast");
        Toast.setParams({
            title: 'Warning',
            message: "This is an Warning Message",
            duration: '1000',
            key: 'info_alt',
            type:'warning',
            mode: 'sticky'
        });
        Toast.fire();
    },
    
    showSuccess : function(component, event, helper){
        var sucToast = $A.get("e.force:showToast");
        sucToast.setParams({
            title: "Success",
            message: 'This is an Success Message',
            duration: '4000',
            key:'info_bar',
            type: 'success',
            mode: 'dismissiable'
        });
        sucToast.fire();
    }
})