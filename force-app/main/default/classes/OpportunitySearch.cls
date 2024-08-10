public with sharing class OpportunitySearch {
    public OpportunitySearch() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunity(String oppName){
        String keyString= '%'+oppName+'%';
        return [Select Id,Name From Opportunity Where Name Like:keyString];
    }
}