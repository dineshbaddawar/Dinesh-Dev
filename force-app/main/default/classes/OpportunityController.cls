public with sharing class OpportunityController {
    public OpportunityController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunity(){
        return [Select id,Name,amount,stageName from Opportunity Limit 10];
    }
}