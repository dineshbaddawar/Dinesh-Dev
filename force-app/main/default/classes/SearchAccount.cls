public with sharing class SearchAccount {
    public SearchAccount() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String actName){
        String keyString = '%'+actName+'%';
        return [Select id,Name From Account Where Name Like:keyString];
        }
    }