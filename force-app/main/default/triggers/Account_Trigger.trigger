trigger Account_Trigger on Account (before insert,After insert, before Update, after Update, before delete, after delete, after undelete) {

     if(trigger.isBefore && trigger.isInsert){
          Account_Utility.UpdateShippingAddress(trigger.new);
     }

     if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
         // Account_Utility.AddErrorAnnualRevenue(trigger.new);
     }

     if(trigger.isAfter && trigger.isInsert){
          Account_Utility.SendCustomNotification(trigger.new);
          Account_Utility.CreConWithAccount(trigger.new);
     }

     if(trigger.isBefore && trigger.isUpdate){
          Account_Utility.UpdateLastname(trigger.new, trigger.oldMap);
     }

     if(trigger.isAfter && trigger.isUpdate){
          Account_Utility.UpdateContactMaillingWithAccountBillingAddress(trigger.new, trigger.oldMap);
     }

     if(trigger.isBefore && trigger.isDelete){
          Account_Utility.ActiveAccountError(trigger.old);
     }

     if(trigger.isAfter && trigger.isDelete){
         // Account_Utility.SendEmailDeleteAccount(trigger.old);
     }

     if(trigger.isAfter && trigger.isUndelete){
          Account_Utility.SendEmailRestoreAccount(trigger.new);
     }
}