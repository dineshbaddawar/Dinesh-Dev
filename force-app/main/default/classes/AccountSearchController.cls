public with sharing class AccountSearchController {
    public AccountSearchController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(String actName){
        List<Account> accountList=new List<Account>();
        if(actName !=''){
            String accountName = '%' + actName+ '%';
            accountList=[Select Id,Name From Account Where Name Like:accountName];
            return accountList;
        }
        return accountList;
    }
}