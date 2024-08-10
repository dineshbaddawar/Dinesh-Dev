public with sharing class DatabaseStateFull implements Database.Batchable <Sobject>, Database.stateful {
  // With the help of Database.stateful we can maintain the Status of the procce
    public Integer ProcessedRecord = 0;
    public Database.QueryLocator Start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id,Name,Phone,(SELECT Id,Name,Phone FROM Contacts) FROM Account');
    }

    public void Execute(Database.BatchableContext bc, List<Account> accList){
        List<Contact> conListToUpdate = new List<Contact>();
        System.debug('Previous  Processed Records:'+ProcessedRecord);
        if(accList.size()>0){
            for(Account acc : accList){
                for(Contact con : acc.Contacts){
                     con.Phone = acc.Phone;
                     conListToUpdate.add(con);
                     ProcessedRecord = ProcessedRecord +1;
                }
            }
            System.debug('The Processed Records Outside For Lopp :'+ProcessedRecord);
            update conListToUpdate;
        }
       
    }

    public void Finish(Database.BatchableContext bc){

    }
}