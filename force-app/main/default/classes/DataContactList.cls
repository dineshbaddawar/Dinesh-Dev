public with sharing class DataContactList {
    public DataContactList() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact (){
        return [Select LastName,FirstName From Contact  Limit 10];
    }
}