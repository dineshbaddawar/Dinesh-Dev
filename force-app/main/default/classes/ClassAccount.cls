public with sharing class ClassAccount {
    public ClassAccount() {

    }
    @AuraEnabled(cacheable=true)
   public static List<Account> getAccount(){
       return [Select Id,Name,Phone From Account];
   }
}