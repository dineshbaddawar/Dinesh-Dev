public with sharing class  lwcAppExampleApex {

    @AuraEnabled(cacheable=true)
    public static List<Contact> retriveContactData(String KeySearch){
        
        List<Contact> contactList=[Select Id,FirstName,LastName,Email,Phone,Account.Name From Contact Where
                                  Account.Name=:KeySearch];
        return contactList;
    }
}