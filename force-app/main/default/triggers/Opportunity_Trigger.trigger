trigger Opportunity_Trigger on Opportunity (before insert,after insert, before update, after update, before delete, after delete, after undelete) {

    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
        Opportunity_Utility.CustomNotification(trigger.new);
    }

    if(trigger.isBefore && trigger.isUpdate){
        Opportunity_Utility.NameUpdateError(trigger.new, trigger.oldMap);
    }
}