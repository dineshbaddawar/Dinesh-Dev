trigger CaseTrigger on Case (before insert,after insert) {
    if(trigger.isBefore && trigger.isInsert){
        CaseTriggerHelper.AssignCaseDefaultQueue(trigger.new);
    }
    if(trigger.isAfter && trigger.isInsert){
        CaseTriggerHelper.RoundRobinLogicCaseOwnerLogic(trigger.new);
    }
}