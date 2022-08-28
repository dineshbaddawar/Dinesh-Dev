public with sharing class decoratorTrackClass {
    public decoratorTrackClass() {

    }
    @AuraEnabled(cacheable=true)
    public static List<IPL__c> getTeam(){
        List<IPL__c> TeamDetails = [Select Id,Name From IPL__c];
        return TeamDetails;
    }
}