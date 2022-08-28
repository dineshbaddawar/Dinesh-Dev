public with sharing class ContactController {
    public ContactController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact(){
        return [Select Id,FirstName,LastName From Contact];
    }
}