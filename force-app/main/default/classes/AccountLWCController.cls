public class AccountLWCController {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
        return [Select Id,Name From Account];
    }
    @AuraEnabled
    public static List<Contact> getContacts(String accountId){
        return [Select Id,FirstName, LastName,Email,Phone From Contact Where AccountId =:AccountId];
    }
}