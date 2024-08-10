public with sharing class DataAccountList {
    public DataAccountList() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        return [Select Id,Name,Phone From Account Limit 10];
    }
}