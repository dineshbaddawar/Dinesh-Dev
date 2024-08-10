public with sharing class AccountSearchCls {
    public AccountSearchCls() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String actName){
        String keyString = '%'+actName+'%';
        return [Select id,Name From Account Where Name Like:keyString];
    }
}