public with sharing class ContactApex {
    public ContactApex() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        return [Select id,LastName,FirstName,Phone,Email from Contact Limit 10];
    }
}