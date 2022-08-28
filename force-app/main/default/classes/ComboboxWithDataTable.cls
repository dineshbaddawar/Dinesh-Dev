public with sharing class ComboboxWithDataTable {
    public ComboboxWithDataTable() {

    }
    // This method reurn list Account In LWC
    @AuraEnabled 
    public static List<Account> getAccountForCombobox(){
        List<Account> accountList=[Select Id,Name From Account];
        return accountList;
    }

    // This method will return the Contacts of Selected Account In LWC Combobox
    @AuraEnabled 
    public static List<Contact> getContacts(String selectedAccountId){
    
        List<Contact> contactList=[Select Id,Name,Email,AccountId From Contact Where 
        AccountId =:selectedAccountId];
        return contactList;
    }
}