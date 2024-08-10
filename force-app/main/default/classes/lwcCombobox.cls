public with sharing class lwcCombobox {
    public lwcCombobox() {

    } 
    @AuraEnabled
    public Static List<Account> getAccounts(){
        List<Account> accList=[Select Id,Name From Account];
        return accList;
    }
}