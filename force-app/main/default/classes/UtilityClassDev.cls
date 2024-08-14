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
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(String actName){
        List<Account> accountList=new List<Account>();
        if(actName !=''){
            String accountName = '%' + actName+ '%';
            accountList=[Select Id,Name From Account Where Name Like:accountName];
            return accountList;
        }
        return accountList;
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunitiesByDate(String startDate, String endDate) {
        Date start = parseDate(startDate);
        Date enddate1 = parseDate(endDate);
        List<Opportunity>  getOppList = [ SELECT Id, Name, CloseDate, StageName, Amount FROM Opportunity
            WHERE CloseDate >= :start AND CloseDate <= :enddate1
        ];
        System.debug('Record Size == >'+getOppList.size());
        return getOppList;
    }

    private static Date parseDate(String dateString) {
        List<String> dateParts = dateString.split('-');
        if (dateParts.size() != 3) {
            throw new IllegalArgumentException('Invalid date format. Expected YYYY-MM-DD');
        }
        Integer year = Integer.valueOf(dateParts[0]);
        Integer month = Integer.valueOf(dateParts[1]);
        Integer day = Integer.valueOf(dateParts[2]);
        return Date.newInstance(year, month, day);
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactListBulkDelete(String recordId ){
        return [ SELECT Id, firstName,lastName, Title, Phone, Email,Name,AccountId 
                 FROM Contact WHERE AccountId =:recordId order by createdDate desc];
    }

    /*This method deletes the selecteds based on the contact ids sent from LWC */
    @AuraEnabled
    public static Void  deleteSelectedContacts(List<Id> selContactIdList){
        List<Contact> contactList = new List<Contact>();
        contactList = [select id from Contact where id in:selContactIdList];
        if(contactList!=null && contactList.size()>0){
            delete contactList;
        }
    }
}