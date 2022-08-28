public with sharing class AccountApex {
    public AccountApex() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){

        return [Select Id,Name,Phone From Account];
    }
}