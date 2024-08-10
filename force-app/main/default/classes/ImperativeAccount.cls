public with sharing class ImperativeAccount {
    public ImperativeAccount() {

    }
    @AuraEnabled 
    public static List<Account> getAccount(){
        return [Select id,Name,Phone From Account Limit 10];
    }
}