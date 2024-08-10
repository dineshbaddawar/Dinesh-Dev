public with sharing class ContactSearch {
    public ContactSearch() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String conName){
        String keyString = '%'+conName+'%';
        return [Select Id,LastName From Contact Where LastName Like:keyString ];
    }
}