public with sharing class customSearchSobjectLWC {
    public customSearchSobjectLWC() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(String searchKey){
        String searchKeyword = '%'+searchKey+'%';
        // creating List to store Search Result
        List<Contact> contactListRecord=new List<Contact>();
        // Query for contact records
        for(Contact conObj:[Select Id,Name,Email,FirstName,LastName,
        Phone From Contact Where Name Like:searchKeyword]){
            contactListRecord.add(conObj);
        }
        if(contactListRecord.size()==0){
        throw new AuraHandledException('No Record Found');
        }
        return contactListRecord;
    }
}