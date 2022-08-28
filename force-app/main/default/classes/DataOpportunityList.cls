public with sharing class DataOpportunityList {
    public DataOpportunityList() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunity(){
        return [Select Name,Amount From Opportunity Limit 10];
    }
}