public with sharing class lwcCombobox_1 {
    public lwcCombobox_1() {

    }
    @AuraEnabled 
    public static List<Contact> conList(){
        List<Contact> con=[Select Id,LastName From Contact];
        return con;
    }
}