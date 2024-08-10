({
    doInit : function(component, event, helper) {
        debugger;
        var baseURl = window.location.href;

        const parts = baseURl.split('/');
        const extractedValueURL = parts[parts.length - 2];

        var lastIndex = baseURl.lastIndexOf('/');
        var extractedValue = baseURl.slice(lastIndex - 2);
         var action = component.get("c.downloadPDFQuote");
         action.setParams({
            quoteId : extractedValueURL
         });
         action.setCallback(this,function(response){
            if(response.getState() === "SUCCESS"){
                var data = response.getReturnValue();
                if(data === "Success"){
                    alert("PDF Donwloaded Successfullty1");
                    var dismissActionPanel = $A.get("e.force:closeQuickAction");
                    dismissActionPanel.fire();
                }else{
                    alert("Something went wrong");
                }
            } else if(response.getState() === "ERROR"){
                var errors = action.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert(errors[0].message);
                    }
                }

            }
         });
         $A.enqueueAction(action);
    }
})