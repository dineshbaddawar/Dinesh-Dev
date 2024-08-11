public with sharing class UtilityClassDev {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
        return [SELECT Id,Name FROM Account LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(String searchKey){
        String searchKeyword = '%'+searchKey+'%';
        List<Contact> contactListRecord=new List<Contact>();
        for(Contact conObj:[Select Id,Name,Email, Phone From Contact Where Name Like:searchKeyword LIMIT 20]){
            contactListRecord.add(conObj);
        }
        if(contactListRecord.size()==0){
        throw new AuraHandledException('No Record Found');
        }
        return contactListRecord;
    }
    
}