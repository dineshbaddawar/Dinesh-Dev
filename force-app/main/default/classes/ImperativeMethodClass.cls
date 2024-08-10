public with sharing class ImperativeMethodClass {
    public ImperativeMethodClass() {

    }
    @AuraEnabled 
    public Static List<IPL__c> getTeam(){
        List<IPL__c> getTeamList=[Select Id,Name From IPL__c];
        return getTeamList;
    }
}