public with sharing class AccountController {
    public AccountController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [select id,name,phone,industry from Account Limit 10 ];
    }
}