public with sharing class ForEachClass {
    public ForEachClass() {

    }
    @AuraEnabled(cacheable=true)
    public static List<IPL__c> getTeam(){
        List<IPL__c> TeamList=[Select Id,Name From IPL__c];
        return TeamList;
    }
}