public with sharing class OpportunityController1 {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunitiesByDate(String startDate, String endDate) {
        Date start = Date.parse(startDate);
        Date enddate1 = Date.parse(endDate);

        return [
            SELECT Id, Name, CloseDate, StageName, Amount
            FROM Opportunity
            WHERE CloseDate >= :start AND CloseDate <= :enddate1
        ];
    }
}